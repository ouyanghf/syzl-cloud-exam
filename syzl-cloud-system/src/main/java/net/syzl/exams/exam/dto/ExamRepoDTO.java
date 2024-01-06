package net.syzl.exams.exam.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 检测量表数据传输类
* </p>
*
* @author admin
* @since 2020-09-05 11:14
*/
@Data
@Schema(name ="检测量表", description="检测量表")
public class ExamRepoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @Schema(description = "ID", required=true)
    private String id;
    
    @Schema(description = "检测ID", required=true)
    private String examId;
    
    @Schema(description = "量表ID", required=true)
    private String repoId;
    
    @Schema(description = "单选题数量", required=true)
    private Integer radioCount;
    
    @Schema(description = "单选题分数", required=true)
    private Integer radioScore;
    
    @Schema(description = "多选题数量", required=true)
    private Integer multiCount;
    
    @Schema(description = "多选题分数", required=true)
    private Integer multiScore;
    
    @Schema(description = "判断题数量", required=true)
    private Integer judgeCount;
    
    @Schema(description = "判断题分数", required=true)
    private Integer judgeScore;
    
}
