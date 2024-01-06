package net.syzl.exams.repo.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 量表请求类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@Schema(name ="量表", description="量表")
public class RepoDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "量表ID", required=true)
    private String id;

    @Schema(description = "量表编号", required=true)
    private String code;

    @Schema(description = "量表名称", required=true)
    private String title;

    @Schema(description = "量表备注", required=true)
    private String remark;

    @Schema(description = "创建时间", required=true)
    private Date createTime;

    @Schema(description = "更新时间", required=true)
    private Date updateTime;
    
}
