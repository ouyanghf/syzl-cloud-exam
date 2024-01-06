package net.syzl.exams.exam.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import net.syzl.exams.paper.enums.ExamState;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
* 检测数据传输类
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
@Data
@Schema(name ="检测", description="检测")
public class ExamDTO implements Serializable {


    private static final long serialVersionUID = 1L;


    @Schema(description = "ID", required=true)
    private String id;

    @Schema(description = "检测名称", required=true)
    private String title;

    @Schema(description = "检测描述", required=true)
    private String content;

    @Schema(description = "1公开2部门3定员", required=true)
    private Integer openType;

    @Schema(description = "检测状态", required=true)
    private Integer state;

    @Schema(description = "是否限时", required=true)
    private Boolean timeLimit;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Schema(description = "开始时间", required=true)
    private Date startTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Schema(description = "结束时间", required=true)
    private Date endTime;

    @Schema(description = "创建时间", required=true)
    private Date createTime;

    @Schema(description = "更新时间", required=true)
    private Date updateTime;

    @Schema(description = "总分数" )
    private Integer totalScore;

    @Schema(description = "总时长（分钟）", required=true)
    private Integer totalTime;

    @Schema(description = "及格分数" )
    private Integer qualifyScore;

    /**
     * 是否结束
     * @return
     */
    public Integer getState(){

        if(this.timeLimit!=null && this.timeLimit){

            if(System.currentTimeMillis() < startTime.getTime() ){
                return ExamState.READY_START;
            }

            if(System.currentTimeMillis() > endTime.getTime()){
                return ExamState.OVERDUE;
            }

            if(System.currentTimeMillis() > startTime.getTime()
                    && System.currentTimeMillis() < endTime.getTime()
                    && !ExamState.DISABLED.equals(this.state)){
                return ExamState.ENABLE;
            }

        }

        return this.state;
    }
}
