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
@Schema(name ="试题量表批量操作类", description="试题量表批量操作类")
public class QuRepoBatchReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "题目ID", required=true)
    private List<String> quIds;

    @Schema(description = "题目类型", required=true)
    private List<String> repoIds;

    @Schema(description = "是否移除，否就新增；是就移除", required=true)
    private Boolean remove;
    
}
