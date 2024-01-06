package net.syzl.exams.user.book.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 错题本请求类
* </p>
*
* @author admin
* @since 2020-05-27 17:56
*/
@Data
@Schema(name ="错题本", description="错题本")
public class UserBookDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @Schema(description = "ID", required=true)
    private String id;

    @Schema(description = "检测ID", required=true)
    private String examId;

    @Schema(description = "用户ID", required=true)
    private String userId;

    @Schema(description = "题目ID", required=true)
    private String quId;

    @Schema(description = "加入时间", required=true)
    private Date createTime;

    @Schema(description = "最近错误时间", required=true)
    private Date updateTime;

    @Schema(description = "错误时间", required=true)
    private Integer wrongCount;

    @Schema(description = "题目标题", required=true)
    private String title;

    @Schema(description = "错题序号", required=true)
    private Integer sort;

}