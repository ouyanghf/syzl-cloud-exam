package net.syzl.exams.qu.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 试题量表请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="试题量表", description="试题量表")
public class QuRepoDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    private String id;

    @Schema(description = "试题", required=true)
    private String quId;

    @Schema(description = "归属量表", required=true)
    private String repoId;

    @Schema(description = "题目类型", required=true)
    private Integer quType;

    @Schema(description = "排序", required=true)
    private Integer sort;

}