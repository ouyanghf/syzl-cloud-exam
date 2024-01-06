package net.syzl.exams.paper.dto.ext;

import net.syzl.exams.paper.dto.PaperQuDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
* <p>
* 试卷考题请求类
* </p>
*
* @author admin
* @since 2020-05-25 17:31
*/
@Data
@Schema(name ="试卷题目详情类", description="试卷题目详情类")
public class PaperQuDetailDTO extends PaperQuDTO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "图片", required=true)
    private String image;

    @Schema(description = "题目内容", required=true)
    private String content;

    @Schema(description = "选项内容", required=true)
    List<PaperQuAnswerExtDTO> answerList;
}
