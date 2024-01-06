package net.syzl.exams.repo.dto.response;

import net.syzl.exams.repo.dto.RepoDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
* <p>
* 量表请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="量表分页响应类", description="量表分页响应类")
public class RepoRespDTO extends RepoDTO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "多选题数量", required=true)
    private Integer multiCount;

    @Schema(description = "单选题数量", required=true)
    private Integer radioCount;

    @Schema(description = "判断题数量", required=true)
    private Integer judgeCount;

}
