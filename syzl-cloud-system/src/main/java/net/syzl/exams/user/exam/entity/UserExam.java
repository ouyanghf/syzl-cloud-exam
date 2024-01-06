package net.syzl.exams.user.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.util.Date;

/**
* <p>
* 检测记录实体类
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/
@Data
@TableName("el_user_exam")
public class UserExam extends Model<UserExam> {

    private static final long serialVersionUID = 1L;
    
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 用户ID
    */
    @TableField("user_id")
    private String userId;
    
    /**
    * 检测ID
    */
    @TableField("exam_id")
    private String examId;
    
    /**
    * 检测次数
    */
    @TableField("try_count")
    private Integer tryCount;
    
    /**
    * 最高分数
    */
    @TableField("max_score")
    private Integer maxScore;
    
    /**
    * 是否通过
    */
    private Boolean passed;
    
    /**
    * 创建时间
    */
    @TableField("create_time")
    private Date createTime;
    
    /**
    * 更新时间
    */
    @TableField("update_time")
    private Date updateTime;
    
}
