package net.syzl.exams.user.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.user.UserUtils;
import net.syzl.exams.user.exam.dto.request.UserExamReqDTO;
import net.syzl.exams.user.exam.dto.response.UserExamRespDTO;
import net.syzl.exams.user.exam.entity.UserExam;
import net.syzl.exams.user.exam.mapper.UserExamMapper;
import net.syzl.exams.user.exam.service.UserExamService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
* <p>
* 检测记录业务实现类
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/
@Service
public class UserExamServiceImpl extends ServiceImpl<UserExamMapper, UserExam> implements UserExamService {

    @Override
    public IPage<UserExamRespDTO> paging(PagingReqDTO<UserExamReqDTO> reqDTO) {

        //转换结果
        IPage<UserExamRespDTO> pageData = baseMapper.paging(reqDTO.toPage(), reqDTO.getParams());
        return pageData;
     }

    @Override
    public IPage<UserExamRespDTO> myPaging(PagingReqDTO<UserExamReqDTO> reqDTO) {

        UserExamReqDTO params = reqDTO.getParams();


        if(params==null){
            params = new UserExamReqDTO();
        }

        params.setUserId(UserUtils.getUserId());


        //转换结果
        IPage<UserExamRespDTO> pageData = baseMapper.paging(reqDTO.toPage(), params);
        return pageData;
    }

    @Override
    public void joinResult(String userId, String examId, Integer score, boolean passed) {

        //查询条件
        QueryWrapper<UserExam> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserExam::getUserId, userId)
                .eq(UserExam::getExamId, examId);

        UserExam record = this.getOne(wrapper, false);
        if(record == null){
            record = new UserExam();
            record.setCreateTime(new Date());
            record.setUpdateTime(new Date());
            record.setUserId(userId);
            record.setExamId(examId);
            record.setMaxScore(score);
            record.setPassed(passed);
            this.save(record);
            return;
        }

        // 修复低分数不加入统计问题
        record.setTryCount(record.getTryCount()+1);
        record.setUpdateTime(new Date());

        if(record.getMaxScore() < score){
            record.setMaxScore(score);
            record.setPassed(passed);
        }

        this.updateById(record);


    }
}
