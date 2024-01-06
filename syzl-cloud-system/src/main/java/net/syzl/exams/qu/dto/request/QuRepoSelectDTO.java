package net.syzl.exams.qu.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 问题题目请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="题目查询请求类", description="题目查询请求类")
public class QuRepoSelectDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "试题")
    private String quId;
    @Schema(description = "归属量表")
    private String repoId;
    @Schema(description = "题号")
    private String no;
    @Schema(description = "题目名")
    private String title;
    
}
