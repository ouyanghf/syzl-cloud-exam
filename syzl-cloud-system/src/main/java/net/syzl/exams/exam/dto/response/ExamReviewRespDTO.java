package net.syzl.exams.exam.dto.response;

import net.syzl.exams.exam.dto.ExamDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
* <p>
* 检测分页响应类
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
@Data
@Schema(name ="阅卷分页响应类", description="阅卷分页响应类")
public class ExamReviewRespDTO extends ExamDTO {

    private static final long serialVersionUID = 1L;


    @Schema(description = "检测人数", required=true)
    private Integer examUser;

    @Schema(description = "待阅试卷", required=true)
    private Integer unreadPaper;



}
