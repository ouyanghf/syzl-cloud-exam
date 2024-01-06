package net.syzl.exams.paper.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

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
public class PaperListReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "用户ID", required=true)
    private String userId;

    @Schema(description = "部门ID", required=true)
    private String departId;

    @Schema(description = "规则ID", required=true)
    private String examId;

    @Schema(description = "用户昵称", required=true)
    private String realName;

    @Schema(description = "试卷状态", required=true)
    private Integer state;

    
}
