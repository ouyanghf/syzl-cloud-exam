package net.syzl.exams.paper.dto.response;

import net.syzl.exams.paper.dto.PaperDTO;
import net.syzl.exams.paper.dto.ext.PaperQuDetailDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(name ="检测结果展示响应类", description="检测结果展示响应类")
public class ExamResultRespDTO extends PaperDTO {

    @Schema(description = "问题列表", required=true)
    private List<PaperQuDetailDTO> quList;

}
