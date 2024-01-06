package net.syzl.exams.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.exam.dto.ExamDTO;
import net.syzl.exams.exam.dto.response.ExamOnlineRespDTO;
import net.syzl.exams.exam.dto.response.ExamReviewRespDTO;
import net.syzl.exams.exam.entity.Exam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 检测Mapper
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
@Mapper
public interface ExamMapper extends BaseMapper<Exam> {

    /**
     * 查找分页内容
     * @param page
     * @param query
     * @return
     */
    IPage<ExamDTO> paging(Page page, @Param("query") ExamDTO query);

    /**
     * 查找分页内容
     * @param page
     * @param query
     * @return
     */
    IPage<ExamReviewRespDTO> reviewPaging(Page page, @Param("query") ExamDTO query);

    /**
     * 在线检测分页响应类-考生视角
     * @param page
     * @param query
     * @return
     */
    IPage<ExamOnlineRespDTO> online(Page page, @Param("query") ExamDTO query);

    List<ExamOnlineRespDTO> onlineExam(@Param("userId") String userId);
}
