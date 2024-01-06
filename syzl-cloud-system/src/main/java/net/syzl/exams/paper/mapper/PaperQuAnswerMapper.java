package net.syzl.exams.paper.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.syzl.exams.paper.dto.ext.PaperQuAnswerExtDTO;
import net.syzl.exams.paper.entity.PaperQuAnswer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 试卷考题备选答案Mapper
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/@Mapper
public interface PaperQuAnswerMapper extends BaseMapper<PaperQuAnswer> {

    /**
     * 查找试卷试题答案列表
     * @param paperId
     * @param quId
     * @return
     */
    List<PaperQuAnswerExtDTO> list(@Param("paperId") String paperId, @Param("quId") String quId);

    /**
     * 查找试卷试题答案列表
     * @param paperId
     * @param quId
     * @return
     */
    List<PaperQuAnswerExtDTO> listForShow(@Param("paperId") String paperId, @Param("quId") String quId);
}
