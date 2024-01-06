package net.syzl.exams.paper.dto.request;

import net.syzl.exams.core.api.dto.BaseDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author bool
 */
@Data
@Schema(name ="查找试卷题目详情请求类", description="查找试卷题目详情请求类")
public class PaperQuQueryDTO extends BaseDTO {

    @Schema(description = "试卷ID", required=true)
    private String paperId;

    @Schema(description = "题目ID", required=true)
    private String quId;

}
