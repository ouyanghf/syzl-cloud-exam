package net.syzl.exams.user.exam.dto.request;

import net.syzl.exams.user.exam.dto.UserExamDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

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
public class UserExamReqDTO extends UserExamDTO {

    private static final long serialVersionUID = 1L;


    @Schema(description = "检测名称", required=true)
    private String title;

    @Schema(description = "人员名称", required=true)
    private String realName;


}
