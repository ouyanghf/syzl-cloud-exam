package net.syzl.exams.exam.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import net.syzl.exams.exam.dto.ExamDTO;
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
@Schema(name ="在线检测分页响应类", description="在线检测分页响应类")
public class ExamOnlineRespDTO extends ExamDTO {

    private static final long serialVersionUID = 1L;


}
