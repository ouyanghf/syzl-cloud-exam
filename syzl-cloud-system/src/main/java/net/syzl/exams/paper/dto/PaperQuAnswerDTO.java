package net.syzl.exams.paper.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

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
public class PaperQuAnswerDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "自增ID", required=true)
    private String id;

    @Schema(description = "试卷ID", required=true)
    private String paperId;

    @Schema(description = "回答项ID", required=true)
    private String answerId;

    @Schema(description = "题目ID", required=true)
    private String quId;

    @Schema(description = "是否正确项", required=true)
    private Boolean isRight;

    @Schema(description = "是否选中", required=true)
    private Boolean checked;

    @Schema(description = "排序", required=true)
    private Integer sort;

    @Schema(description = "选项标签", required=true)
    private String abc;

    @Schema(description = "分值")
    private Integer itemScore;
}
