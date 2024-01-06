package net.syzl.exams.paper.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnore;
import net.syzl.exams.core.api.dto.BaseDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author bool
 */
@Data
@Schema(name ="试卷创建请求类", description="试卷创建请求类")
public class PaperCreateReqDTO extends BaseDTO {

    @JsonIgnore
    private String userId;

    @Schema(description = "检测ID", required=true)
    private String examId;

}
