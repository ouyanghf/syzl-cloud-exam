package net.syzl.exams.qu.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 问题题目请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="问题题目", description="问题题目")
public class QuDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "题目ID", required=true)
    private String id;
    private Integer no;

    @Schema(description = "题目类型", required=true)
    private Integer quType;

    @Schema(description = "1普通,2较难", required=true)
    private Integer level;

    @Schema(description = "题目图片", required=true)
    private String image;

    @Schema(description = "题目内容", required=true)
    private String content;


    @Schema(description = "创建时间", required=true)
    private Date createTime;

    @Schema(description = "更新时间", required=true)
    private Date updateTime;

    @Schema(description = "题目备注", required=true)
    private String remark;

    @Schema(description = "整题解析", required=true)
    private String analysis;

    @Schema(description = "量表" )
    private String repoName;
}
