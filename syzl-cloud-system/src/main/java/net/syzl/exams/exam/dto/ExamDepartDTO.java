package net.syzl.exams.exam.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 检测部门数据传输类
* </p>
*
* @author admin
* @since 2020-09-03 17:24
*/
@Data
@Schema(name ="检测部门", description="检测部门")
public class ExamDepartDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID", required=true)
    private String id;
    
    @Schema(description = "检测ID", required=true)
    private String examId;
    
    @Schema(description = "部门ID", required=true)
    private String departId;
    
}
