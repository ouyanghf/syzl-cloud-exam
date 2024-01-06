package net.syzl.exams.paper.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.paper.dto.PaperQuAnswerDTO;
import net.syzl.exams.paper.dto.ext.PaperQuAnswerExtDTO;
import net.syzl.exams.paper.entity.PaperQuAnswer;
import net.syzl.exams.paper.mapper.PaperQuAnswerMapper;
import net.syzl.exams.paper.service.PaperQuAnswerService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* <p>
* 语言设置 服务实现类
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/
@Service
public class PaperQuAnswerServiceImpl extends ServiceImpl<PaperQuAnswerMapper, PaperQuAnswer> implements PaperQuAnswerService {

    @Override
    public IPage<PaperQuAnswerDTO> paging(PagingReqDTO<PaperQuAnswerDTO> reqDTO) {

        //创建分页对象
        IPage<PaperQuAnswer> query = new Page<>(reqDTO.getCurrent(), reqDTO.getSize());

        //查询条件
        QueryWrapper<PaperQuAnswer> wrapper = new QueryWrapper<>();

        //获得数据
        IPage<PaperQuAnswer> page = this.page(query, wrapper);
        //转换结果
        IPage<PaperQuAnswerDTO> pageData = JSON.parseObject(JSON.toJSONString(page), new TypeReference<Page<PaperQuAnswerDTO>>(){});
        return pageData;
     }

    @Override
    public List<PaperQuAnswerExtDTO> listForExam(String paperId, String quId) {
        return baseMapper.list(paperId, quId);
    }

    @Override
    public List<PaperQuAnswer> listForFill(String paperId, String quId) {
        //查询条件
        QueryWrapper<PaperQuAnswer> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .eq(PaperQuAnswer::getPaperId, paperId)
                .eq(PaperQuAnswer::getQuId, quId);

        return this.list(wrapper);
    }
}
