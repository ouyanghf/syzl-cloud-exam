package net.syzl.exams.qu.dto.ext;

import net.syzl.exams.qu.dto.QuAnswerDTO;
import net.syzl.exams.qu.dto.QuDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
* <p>
* 问题题目请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="问题题目详情", description="问题题目详情")
public class QuDetailDTO extends QuDTO {

    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "备选项列表", required=true)
    private List<QuAnswerDTO> answerList;

    @Schema(description = "量表列表", required=true)
    private List<String> repoIds;

    
}
