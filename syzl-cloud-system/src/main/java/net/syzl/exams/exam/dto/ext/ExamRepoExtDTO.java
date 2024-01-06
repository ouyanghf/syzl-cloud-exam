package net.syzl.exams.exam.dto.ext;

import net.syzl.exams.exam.dto.ExamRepoDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
* <p>
* 检测量表数据传输类
* </p>
*
* @author admin
* @since 2020-09-05 11:14
*/
@Data
@Schema(name ="检测量表扩展响应类", description="检测量表扩展响应类")
public class ExamRepoExtDTO extends ExamRepoDTO {

    private static final long serialVersionUID = 1L;

    
    @Schema(description = "单选题总量", required=true)
    private Integer totalRadio;
    
    @Schema(description = "多选题总量", required=true)
    private Integer totalMulti;
    
    @Schema(description = "判断题总量", required=true)
    private Integer totalJudge;
    
}
