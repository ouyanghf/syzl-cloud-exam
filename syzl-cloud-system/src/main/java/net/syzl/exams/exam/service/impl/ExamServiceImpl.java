package net.syzl.exams.exam.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.enums.OpenType;
import net.syzl.exams.core.exception.ServiceException;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.exam.dto.ExamDTO;
import net.syzl.exams.exam.dto.ExamRepoDTO;
import net.syzl.exams.exam.dto.ext.ExamRepoExtDTO;
import net.syzl.exams.exam.dto.request.ExamSaveReqDTO;
import net.syzl.exams.exam.dto.response.ExamOnlineRespDTO;
import net.syzl.exams.exam.dto.response.ExamReviewRespDTO;
import net.syzl.exams.exam.entity.Exam;
import net.syzl.exams.exam.mapper.ExamMapper;
import net.syzl.exams.exam.service.ExamDepartService;
import net.syzl.exams.exam.service.ExamService;
import net.syzl.exams.exam.service.ExamRepoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 检测业务实现类
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements ExamService {


    @Autowired
    private ExamRepoService examRepoService;

    @Autowired
    private ExamDepartService examDepartService;

    @Override
    public void save(ExamSaveReqDTO reqDTO) {
        // ID
        String id = reqDTO.getId();
        if(StringUtils.isBlank(id)){
            id = IdWorker.getIdStr();
        }
        //复制参数
        Exam entity = new Exam();
        // 计算分值
        this.calcScore(reqDTO);
        // 复制基本数据
        BeanMapper.copy(reqDTO, entity);
        entity.setId(id);
        // 修复状态
        if (reqDTO.getTimeLimit()!=null
                && !reqDTO.getTimeLimit()
                && reqDTO.getState()!=null
                && reqDTO.getState() == 2) {
            entity.setState(0);
        } else {
            entity.setState(reqDTO.getState());
        }

        // 量表组卷
        try {
            examRepoService.saveAll(id, reqDTO.getRepoList());
        }catch (DuplicateKeyException e){
            throw new ServiceException(1, "不能选择重复的量表！");
        }


        // 开放的部门
        if(OpenType.DEPT_OPEN.equals(reqDTO.getOpenType())){
            examDepartService.saveAll(id, reqDTO.getDepartIds());
        }

        this.saveOrUpdate(entity);

    }

    @Override
    public ExamSaveReqDTO findDetail(String id) {
        ExamSaveReqDTO respDTO = new ExamSaveReqDTO();
        Exam exam = this.getById(id);
        BeanMapper.copy(exam, respDTO);

        // 检测部门
        List<String> departIds = examDepartService.listByExam(id);
        respDTO.setDepartIds(departIds);

        // 量表
        List<ExamRepoExtDTO> repos = examRepoService.listByExam(id);
        respDTO.setRepoList(repos);

        return respDTO;
    }

    @Override
    public ExamDTO findById(String id) {
        ExamDTO respDTO = new ExamDTO();
        Exam exam = this.getById(id);
        BeanMapper.copy(exam, respDTO);
        return respDTO;
    }

    @Override
    public IPage<ExamDTO> paging(PagingReqDTO<ExamDTO> reqDTO) {

        //创建分页对象
        Page page = new Page(reqDTO.getCurrent(), reqDTO.getSize());

        //转换结果
        IPage<ExamDTO> pageData = baseMapper.paging(page, reqDTO.getParams());
        return pageData;
     }

    @Override
    public IPage<ExamOnlineRespDTO> onlinePaging(PagingReqDTO<ExamDTO> reqDTO) {
        // 创建分页对象
        Page page = new Page(reqDTO.getCurrent(), reqDTO.getSize());
        // 查找分页
        IPage<ExamOnlineRespDTO> pageData = baseMapper.online(page, reqDTO.getParams());

        return pageData;
    }

    @Override
    public IPage<ExamReviewRespDTO> reviewPaging(PagingReqDTO<ExamDTO> reqDTO) {
        // 创建分页对象
        Page page = new Page(reqDTO.getCurrent(), reqDTO.getSize());
        // 查找分页
        IPage<ExamReviewRespDTO> pageData = baseMapper.reviewPaging(page, reqDTO.getParams());
        return pageData;
    }

    @Override
    public List<ExamOnlineRespDTO> onlineExam(String userId) {
        List<ExamOnlineRespDTO> list = baseMapper.onlineExam(userId);
        return list;
    }
    /**
     * 计算分值
     * @param reqDTO
     */
    private void calcScore(ExamSaveReqDTO reqDTO){
        // 主观题分数
        int objScore = 0;
        // 量表组卷
        List<ExamRepoExtDTO> repoList = reqDTO.getRepoList();
        for(ExamRepoDTO item: repoList){
            if(item.getRadioCount()!=null
                    && item.getRadioCount()>0
                    && item.getRadioScore()!=null
                    && item.getRadioScore()>0){
                objScore+=item.getRadioCount()*item.getRadioScore();
            }
            if(item.getMultiCount()!=null
                    && item.getMultiCount()>0
                    && item.getMultiScore()!=null
                    && item.getMultiScore()>0){
                objScore+=item.getMultiCount()*item.getMultiScore();
            }
            if(item.getJudgeCount()!=null
                    && item.getJudgeCount()>0
                    && item.getJudgeScore()!=null
                    && item.getJudgeScore()>0){
                objScore+=item.getJudgeCount()*item.getJudgeScore();
            }
        }
        reqDTO.setTotalScore(objScore);
    }

}
