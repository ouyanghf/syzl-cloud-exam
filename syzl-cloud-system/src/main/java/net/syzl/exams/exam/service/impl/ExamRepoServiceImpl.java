package net.syzl.exams.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.exception.ServiceException;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.exam.dto.ext.ExamRepoExtDTO;
import net.syzl.exams.exam.entity.ExamRepo;
import net.syzl.exams.exam.mapper.ExamRepoMapper;
import net.syzl.exams.exam.service.ExamRepoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
* <p>
* 检测量表业务实现类
* </p>
*
* @author admin
* @since 2020-09-05 11:14
*/
@Service
public class ExamRepoServiceImpl extends ServiceImpl<ExamRepoMapper, ExamRepo> implements ExamRepoService {


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveAll(String examId, List<ExamRepoExtDTO> list) {

        // 先删除
        QueryWrapper<ExamRepo> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRepo::getExamId, examId);
        this.remove(wrapper);

        // 再增加
        if(CollectionUtils.isEmpty(list)){
            throw new ServiceException(1, "必须选择量表！");
        }
        List<ExamRepo> repos = BeanMapper.mapList(list, ExamRepo.class);
        for(ExamRepo item: repos){
            item.setExamId(examId);
            item.setId(IdWorker.getIdStr());
        }

        this.saveBatch(repos);
    }

    @Override
    public List<ExamRepoExtDTO> listByExam(String examId) {
        return baseMapper.listByExam(examId);
    }

    @Override
    public void clear(String examId) {

        // 先删除
        QueryWrapper<ExamRepo> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRepo::getExamId, examId);
        this.remove(wrapper);
    }


}
