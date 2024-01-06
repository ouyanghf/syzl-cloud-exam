package net.syzl.exams.user.exam.dto;

import net.syzl.exams.core.annon.Dict;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 检测记录数据传输类
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/
@Data
@Schema(name ="检测记录", description="检测记录")
public class UserExamDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    private String id;
    
    @Schema(description = "用户ID", required=true)
    private String userId;

    @Dict(dictTable = "el_exam", dicText = "title", dicCode = "id")
    @Schema(description = "检测ID", required=true)
    private String examId;
    
    @Schema(description = "检测次数", required=true)
    private Integer tryCount;
    
    @Schema(description = "最高分数", required=true)
    private Integer maxScore;
    
    @Schema(description = "是否通过", required=true)
    private Boolean passed;
    
    @Schema(description = "创建时间")
    private Date createTime;
    
    @Schema(description = "更新时间")
    private Date updateTime;
    
}
