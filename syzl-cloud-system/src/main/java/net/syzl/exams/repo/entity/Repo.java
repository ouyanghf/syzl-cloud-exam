package net.syzl.exams.repo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.util.Date;

/**
* <p>
* 量表实体类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Data
@TableName("el_repo")
public class Repo extends Model<Repo> {

    private static final long serialVersionUID = 1L;

    /**
     * 量表ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 量表编号
     */
    private String code;

    /**
     * 量表名称
     */
    private String title;

    /**
     * 量表备注
     */
    private String remark;

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
