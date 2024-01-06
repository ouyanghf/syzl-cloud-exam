package net.syzl.exams.repo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

/**
 * 量表规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Data
@TableName("el_repo_rule")
public class RepoRule {

    /**
     * ID
     */
	@Schema(description = "ID")
	@TableId(value = "id", type = IdType.ASSIGN_ID)
	private String id;
    /**
     * 规则名称
     */
	@Schema(description = "规则名称")
	private String title;
    /**
     * 量表ID
     */
	@Schema(description = "量表ID")
	@TableField("repo_id")
	private String repoId;
    /**
     * 规则描述
     */
	@Schema(description = "规则描述")
	private String content;
    /**
     * 题目ID聚合
     */
	@Schema(description = "题目ID聚合")
	@TableField("qu_ids")
	private String quIds;
    /**
     * 题号聚合
     */
	@Schema(description = "题号聚合")
	private String nos;
    /**
     * 考试状态
     */
	@Schema(description = "考试状态")
	private Integer state;
	/**
     * 加减乘除
     */
	@Schema(description = "加减乘除")
	private Integer number;
	/**
     * 加减乘除
     */
	@Schema(description = "加减乘除")
	@TableField("rule_type")
	private Integer ruleType;

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
    /**
     * 总分数
     */
	@Schema(description = "总分数")
	private String totalScore;
    /**
     * 得分数
     */
	@Schema(description = "得分数")
	private String score;

	@TableField(exist = false)
	private String repoName;
}