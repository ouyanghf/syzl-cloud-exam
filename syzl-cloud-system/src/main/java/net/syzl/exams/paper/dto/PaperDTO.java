package net.syzl.exams.paper.dto;

import net.syzl.exams.core.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 试卷请求类
* </p>
*
* @author admin
* @since 2020-05-25 17:31
*/
@Data
@Schema(name ="试卷", description="试卷")
public class PaperDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "试卷ID", required=true)
    private String id;

    @Dict(dictTable = "sys_user", dicText = "real_name", dicCode = "id")
    @Schema(description = "用户ID", required=true)
    private String userId;

    @Dict(dictTable = "sys_depart", dicText = "dept_name", dicCode = "id")
    @Schema(description = "部门ID", required=true)
    private String departId;

    @Schema(description = "规则ID", required=true)
    private String examId;

    @Schema(description = "检测标题", required=true)
    private String title;

    @Schema(description = "检测时长", required=true)
    private Integer totalTime;

    @Schema(description = "用户时长", required=true)
    private Integer userTime;

    @Schema(description = "试卷总分", required=true)
    private Integer totalScore;

    @Schema(description = "及格分", required=true)
    private Integer qualifyScore;

    @Schema(description = "客观分", required=true)
    private Integer objScore;

    @Schema(description = "主观分", required=true)
    private Integer subjScore;

    @Schema(description = "用户得分", required=true)
    private Integer userScore;

    @Schema(description = "是否包含简答题", required=true)
    private Boolean hasSaq;

    @Schema(description = "试卷状态", required=true)
    private Integer state;

    @Schema(description = "创建时间", required=true)
    private Date createTime;

    @Schema(description = "更新时间", required=true)
    private Date updateTime;

    @Schema(description = "截止时间")
    private Date limitTime;
    
}
