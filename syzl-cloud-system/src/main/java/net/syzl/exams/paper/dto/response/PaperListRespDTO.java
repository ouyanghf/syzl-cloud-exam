package net.syzl.exams.paper.dto.response;

import net.syzl.exams.paper.dto.PaperDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
* <p>
* 试卷请求类
* </p>
*
* @author admin
* @since 2020-05-25 17:31
*/
@Data
@Schema(name ="试卷列表响应类", description="试卷列表响应类")
public class PaperListRespDTO extends PaperDTO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "人员", required=true)
    private String realName;

    
}
