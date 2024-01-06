package net.syzl.exams.qu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.exception.ServiceException;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.qu.dto.QuAnswerDTO;
import net.syzl.exams.qu.dto.QuDTO;
import net.syzl.exams.qu.dto.export.QuExportDTO;
import net.syzl.exams.qu.dto.export.TiExportDTO;
import net.syzl.exams.qu.dto.ext.QuDetailDTO;
import net.syzl.exams.qu.dto.request.QuQueryReqDTO;
import net.syzl.exams.qu.dto.request.QuRepoSelectDTO;
import net.syzl.exams.qu.entity.Qu;
import net.syzl.exams.qu.entity.QuAnswer;
import net.syzl.exams.qu.entity.QuRepo;
import net.syzl.exams.qu.enums.QuType;
import net.syzl.exams.qu.mapper.QuMapper;
import net.syzl.exams.qu.service.QuAnswerService;
import net.syzl.exams.qu.service.QuRepoService;
import net.syzl.exams.qu.service.QuService;
import net.syzl.exams.repo.service.RepoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * <p>
 * 语言设置 服务实现类
 * </p>
 *
 * @author admin
 * @since 2020-05-25 10:17
 */
@Service
public class QuServiceImpl extends ServiceImpl<QuMapper, Qu> implements QuService {

    @Autowired
    private QuAnswerService quAnswerService;

    @Autowired
    private QuRepoService quRepoService;

    @Autowired
    private RepoService repoService;

    @Override
    public IPage<QuDTO> paging(PagingReqDTO<QuQueryReqDTO> reqDTO) {

        //创建分页对象
        Page page = new Page<>(reqDTO.getCurrent(), reqDTO.getSize());

        //转换结果
        IPage<QuDTO> pageData = baseMapper.paging(page, reqDTO.getParams());
        return pageData;
    }
    @Override
    public  IPage<QuDTO> quSelect(PagingReqDTO<QuRepoSelectDTO> reqDTO) {
        //创建分页对象
        Page page = new Page<>(reqDTO.getCurrent(), reqDTO.getSize());
        //转换结果
        IPage<QuDTO> pageData = baseMapper.quSelect(page, reqDTO.getParams());
        return pageData;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<String> ids) {
        // 移除题目
        this.removeByIds(ids);

        // 移除选项
        QueryWrapper<QuAnswer> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(QuAnswer::getQuId, ids);
        quAnswerService.remove(wrapper);

        // 移除量表绑定
        QueryWrapper<QuRepo> wrapper1 = new QueryWrapper<>();
        wrapper1.lambda().in(QuRepo::getQuId, ids);
        quRepoService.remove(wrapper1);
    }

    @Override
    public List<Qu> listByRandom(String repoId, Integer quType, List<String> excludes, Integer size) {
        return baseMapper.listByRandom(repoId, quType, excludes, size);
    }


    public List<Qu> listByRepoId(String repoId) {
        return baseMapper.listByRepoId(repoId);
    }

    @Override
    public QuDetailDTO detail(String id) {

        QuDetailDTO respDTO = new QuDetailDTO();
        Qu qu = this.getById(id);
        BeanMapper.copy(qu, respDTO);

        List<QuAnswerDTO> answerList = quAnswerService.listByQu(id);
        respDTO.setAnswerList(answerList);

        List<String> repoIds = quRepoService.listByQu(id);
        respDTO.setRepoIds(repoIds);

        return respDTO;
    }


    @Transactional(rollbackFor = Exception.class)
    @Override


    public void save(QuDetailDTO reqDTO) {
        // 校验数据
        this.checkData(reqDTO, "");
        Qu qu = new Qu();
        BeanMapper.copy(reqDTO, qu);
        // 更新
        this.saveOrUpdate(qu);
        // 保存全部问题
        quAnswerService.saveAll(qu.getId(), reqDTO.getAnswerList());
        // 保存到量表
        quRepoService.saveAll(qu.getId(), qu.getQuType(), reqDTO.getRepoIds());
    }

    @Override
    public List<QuExportDTO> listForExport(QuQueryReqDTO query) {
        return baseMapper.listForExport(query);
    }

    @Override
    public int importExcel(List<QuExportDTO> dtoList) {
        //根据题目名称分组
        Map<Integer, List<QuExportDTO>> anMap = new HashMap<>(16);
        //题目本体信息
        Map<Integer, QuExportDTO> quMap = new HashMap<>(16);
        //数据分组
        for (QuExportDTO item : dtoList) {
            // 空白的ID
            if (StringUtils.isEmpty(item.getNo())) {
                continue;
            }
            Integer key;
            //序号
            try {
                key = Integer.parseInt(item.getNo());
            } catch (Exception e) {
                continue;
            }

            //如果已经有题目了，直接处理选项
            if (anMap.containsKey(key)) {
                anMap.get(key).add(item);
            } else {
                //如果没有，将题目内容和选项一起
                List<QuExportDTO> subList = new ArrayList<>();
                subList.add(item);
                anMap.put(key, subList);
                quMap.put(key, item);
            }
        }

        int count = 0;
        try {

            //循环题目插入
            for (Integer key : quMap.keySet()) {

                QuExportDTO im = quMap.get(key);

                //题目基本信息
                QuDetailDTO qu = new QuDetailDTO();
                qu.setContent(im.getQContent());
                qu.setAnalysis(im.getQAnalysis());
                qu.setQuType(Integer.parseInt(im.getQuType()));
                qu.setCreateTime(new Date());
                //设置回答列表
                List<QuAnswerDTO> answerList = this.processAnswerList(anMap.get(key));
                //设置题目
                qu.setAnswerList(answerList);
                //设置引用量表
                qu.setRepoIds(im.getRepoList());
                // 保存答案
                this.save(qu);
                count++;
            }

        } catch (ServiceException e) {
            e.printStackTrace();
            throw new ServiceException(1, "导入出现问题，行：" + count + "，" + e.getMessage());
        }

        return count;
    }
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int importTi(List<TiExportDTO> dtoList) {
        int count = 0;
        try {
            //数据分组
            for (TiExportDTO item : dtoList) {
                //题目基本信息
                Qu quBo = new Qu();
                quBo.setContent(item.getContent());
                quBo.setAnalysis("");
                quBo.setNo(new Integer(item.getNo()));
                quBo.setQuType(1);
                quBo.setCreateTime(new Date());
                quBo.setQuType(1);
                quBo.setLevel(1);
                quBo.setImage("");
                quBo.setUpdateTime(new Date());
                quBo.setRemark("");
                // 更新
                this.saveOrUpdate(quBo);
                List<QuAnswerDTO> answerList = this.answerList(item);
                // 保存全部问题
                quAnswerService.saveAll(quBo.getId(),answerList);
                // 保存到量表
                List<String> repoIds = new ArrayList();
                repoIds.add(item.getRepoNo());
                quRepoService.saveAll(quBo.getId(), 1,repoIds);
                count++;
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            throw new ServiceException(1, "导入出现问题，行：" + count + "，" + e.getMessage());
        }
        return count;
    }

    /**
     * 处理回答列表
     * @param item
     * @return
     */
    private List<QuAnswerDTO> answerList(TiExportDTO item) {
        List<QuAnswerDTO> list = new ArrayList<>(16);
        if (!StringUtils.isBlank(item.getAContent())) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight(true);
            a.setContent(item.getAContent());
            a.setAnalysis(null);
            a.setItemScore(new Integer(item.getAItemScore()));
            a.setId("");
            list.add(a);
        }
        if (!StringUtils.isBlank(item.getBContent())) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight(true);
            a.setContent(item.getBContent());
            a.setAnalysis(null);
            a.setItemScore(new Integer(item.getBItemScore()));
            a.setId("");
            list.add(a);
        }
        if (!StringUtils.isBlank(item.getCContent())) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight(true);
            a.setContent(item.getCContent());
            a.setAnalysis(null);
            a.setItemScore(new Integer(item.getCItemScore()));
            a.setId("");
            list.add(a);
        }
        if (!StringUtils.isBlank(item.getDContent())) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight(true);
            a.setContent(item.getDContent());
            a.setAnalysis(null);
            a.setItemScore(new Integer(item.getDItemScore()));
            a.setId("");
            list.add(a);
        }
        if (!StringUtils.isBlank(item.getEContent())) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight(true);
            a.setContent(item.getEContent());
            a.setAnalysis(null);
            a.setItemScore(new Integer(item.getEItemScore()));
            a.setId("");
            list.add(a);
        }
        return list;
    } /**
     * 处理回答列表
     *
     * @param importList
     * @return
     */
    private List<QuAnswerDTO> processAnswerList(List<QuExportDTO> importList) {

        List<QuAnswerDTO> list = new ArrayList<>(16);
        for (QuExportDTO item : importList) {
            QuAnswerDTO a = new QuAnswerDTO();
            a.setIsRight("1".equals(item.getAIsRight()));
            a.setContent(item.getAContent());
            a.setAnalysis(item.getAAnalysis());
            a.setItemScore(new Integer(item.getAItemScore()));
            a.setId("");
            list.add(a);
        }
        return list;
    }

    /**
     * 校验题目信息
     *
     * @param qu
     * @param no
     * @throws Exception
     */
    public void checkData(QuDetailDTO qu, String no) {
        if (StringUtils.isEmpty(qu.getContent())) {
            throw new ServiceException(1, no + "题目内容不能为空！");
        }


        if (CollectionUtils.isEmpty(qu.getRepoIds())) {
            throw new ServiceException(1, no + "至少要选择一个量表！");
        }

        List<QuAnswerDTO> answers = qu.getAnswerList();
            if (CollectionUtils.isEmpty(answers)) {
                throw new ServiceException(1, no + "客观题至少要包含一个备选答案！");
            }

            int trueCount = 0;
            for (QuAnswerDTO a : answers) {

                if (a.getIsRight() == null) {
                    throw new ServiceException(1, no + "必须定义选项是否正确项！");
                }

                if (StringUtils.isEmpty(a.getContent())) {
                    throw new ServiceException(1, no + "选项内容不为空！");
                }

                if (a.getIsRight()) {
                    trueCount += 1;
                }
            }

            if (trueCount == 0) {
              //  throw new ServiceException(1, no + "至少要包含一个正确项！");
            }


            //单选题
            if (qu.getQuType().equals(QuType.RADIO) && trueCount > 1) {
               // throw new ServiceException(1, no + "单选题不能包含多个正确项！");
            }

    }
}
