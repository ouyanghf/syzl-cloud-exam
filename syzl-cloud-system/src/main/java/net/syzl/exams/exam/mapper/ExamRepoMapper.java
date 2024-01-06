package net.syzl.exams.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.syzl.exams.exam.dto.ext.ExamRepoExtDTO;
import net.syzl.exams.exam.entity.ExamRepo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 检测量表Mapper
* </p>
*
* @author admin
* @since 2020-09-05 11:14
*/
@Mapper
public interface ExamRepoMapper extends BaseMapper<ExamRepo> {

    /**
     * 查找检测量表列表
     * @param examId
     * @return
     */
    List<ExamRepoExtDTO> listByExam(@Param("examId") String examId);
}
