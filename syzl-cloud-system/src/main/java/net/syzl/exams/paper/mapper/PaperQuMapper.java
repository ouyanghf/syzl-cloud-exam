package net.syzl.exams.paper.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.syzl.exams.paper.dto.ext.PaperQuDetailDTO;
import net.syzl.exams.paper.entity.PaperQu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 试卷考题Mapper
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/
@Mapper
public interface PaperQuMapper extends BaseMapper<PaperQu> {

    /**
     * 统计客观分
     * @param paperId
     * @return
     */
    int sumObjective(@Param("paperId") String paperId);
    /**
     * 统计客观分
     * @param paperId
     * @return
     */
    int sumUserScore(@Param("paperId") String paperId);

    /**
     * 统计主观分
     * @param paperId
     * @return
     */
    int sumSubjective(@Param("paperId") String paperId);

    /**
     * 找出全部试题列表
     * @param paperId
     * @return
     */
    List<PaperQuDetailDTO> listByPaper(@Param("paperId") String paperId);
}


