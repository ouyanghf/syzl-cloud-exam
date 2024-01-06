package net.syzl.exams.repo.dto.request;

import net.syzl.exams.repo.dto.RepoDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
* <p>
* 量表请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="量表分页请求类", description="量表分页请求类")
public class RepoReqDTO extends RepoDTO {

    private static final long serialVersionUID = 1L;

    @Schema(description = "排除量表ID", required=true)
    private List<String> excludes;

    @Schema(description = "单选题数量", required=true)
    private String title;

}
