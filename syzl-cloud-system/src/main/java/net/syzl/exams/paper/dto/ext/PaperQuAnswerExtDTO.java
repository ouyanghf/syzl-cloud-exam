package net.syzl.exams.paper.dto.ext;

import net.syzl.exams.paper.dto.PaperQuAnswerDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
* <p>
* 试卷考题备选答案请求类
* </p>
*
* @author admin
* @since 2020-05-25 17:31
*/
@Data
@Schema(name ="试卷考题备选答案", description="试卷考题备选答案")
public class PaperQuAnswerExtDTO extends PaperQuAnswerDTO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "试题图片", required=true)
    private String image;

    @Schema(description = "选项内容", required=true)
    private String content;

    
}
