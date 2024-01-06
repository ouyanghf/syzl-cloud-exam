package net.syzl.exams.qu.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
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
@Schema(name ="题目查询请求类", description="题目查询请求类")
public class QuQueryReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "题目类型")
    private Integer quType;

    @Schema(description = "归属量表")
    private List<String> repoIds;

    @Schema(description = "题目内容")
    private String content;

    @Schema(description = "排除ID列表")
    private List<String> excludes;

    
}
