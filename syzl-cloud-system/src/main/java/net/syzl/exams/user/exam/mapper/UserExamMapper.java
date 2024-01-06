package net.syzl.exams.user.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.user.exam.dto.request.UserExamReqDTO;
import net.syzl.exams.user.exam.dto.response.UserExamRespDTO;
import net.syzl.exams.user.exam.entity.UserExam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
* <p>
* 检测记录Mapper
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/@Mapper
public interface UserExamMapper extends BaseMapper<UserExam> {

    /**
     * 我的检测分页
     * @param page
     * @param query
     * @return
     */
    IPage<UserExamRespDTO> paging(Page page, @Param("query") UserExamReqDTO query);

}
