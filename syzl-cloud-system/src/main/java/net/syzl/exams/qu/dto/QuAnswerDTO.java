package net.syzl.exams.qu.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 候选答案请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="候选答案", description="候选答案")
public class QuAnswerDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "答案ID", required=true)
    private String id;

    @Schema(description = "问题ID", required=true)
    private String quId;

    @Schema(description = "是否正确", required=true)
    private Boolean isRight;

    @Schema(description = "选项图片", required=true)
    private String image;

    @Schema(description = "选项内容", required=true)
    private String content;

    @Schema(description = "答案分析", required=true)
    private String analysis;
    @Schema(description = "分值", required=true)
    private Integer itemScore;
    
}
