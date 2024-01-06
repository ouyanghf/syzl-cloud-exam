package net.syzl.exams.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

/**
* <p>
* 检测部门实体类
* </p>
*
* @author admin
* @since 2020-09-03 17:24
*/
@Data
@TableName("el_exam_depart")
public class ExamDepart extends Model<ExamDepart> {

    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;
    
    /**
    * 检测ID
    */
    @TableField("exam_id")
    private String examId;
    
    /**
    * 部门ID
    */
    @TableField("depart_id")
    private String departId;
    
}
