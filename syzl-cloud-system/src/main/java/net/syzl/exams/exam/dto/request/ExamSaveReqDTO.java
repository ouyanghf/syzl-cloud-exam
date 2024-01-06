package net.syzl.exams.exam.dto.request;

import net.syzl.exams.exam.dto.ExamDTO;
import net.syzl.exams.exam.dto.ext.ExamRepoExtDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
* <p>
* 检测保存请求类
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
@Data
@Schema(name ="检测保存请求类", description="检测保存请求类")
public class ExamSaveReqDTO extends ExamDTO {

    private static final long serialVersionUID = 1L;


    @Schema(description = "量表列表", required=true)
    private List<ExamRepoExtDTO> repoList;

    @Schema(description = "检测部门列表", required=true)
    private List<String> departIds;

}
