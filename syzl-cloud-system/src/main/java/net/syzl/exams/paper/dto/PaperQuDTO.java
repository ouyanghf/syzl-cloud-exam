package net.syzl.exams.paper.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 试卷考题请求类
* </p>
*
* @author admin
* @since 2020-05-25 17:31
*/
@Data
@Schema(name ="试卷考题", description="试卷考题")
public class PaperQuDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "ID", required=true)
    private String id;

    @Schema(description = "编号")
    private Integer no;

    @Schema(description = "试卷ID", required=true)
    private String paperId;

    @Schema(description = "题目ID", required=true)
    private String quId;

    @Schema(description = "题目类型", required=true)
    private Integer quType;

    @Schema(description = "是否已答", required=true)
    private Boolean answered;

    @Schema(description = "主观答案", required=true)
    private String answer;

    @Schema(description = "问题排序", required=true)
    private Integer sort;

    @Schema(description = "单题分分值", required=true)
    private Integer score;

    @Schema(description = "实际得分(主观题)", required=true)
    private Integer actualScore;

    @Schema(description = "是否答对", required=true)
    private Boolean isRight;
    
}
