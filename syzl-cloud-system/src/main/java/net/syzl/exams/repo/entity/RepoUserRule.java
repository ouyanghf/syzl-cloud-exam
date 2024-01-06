package net.syzl.exams.repo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;

import lombok.Data;

import java.util.Date;

/**
 * 量表用户规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Data
@TableName("el_repo_user_rule")
public class RepoUserRule {

    /**
     * ID
     */
	@Schema(description = "ID")
	private String id;
    /**
     * 规则名称
     */
	@Schema(description = "规则名称")
	private String title;
    /**
     * 用户ID
     */
	@Schema(description = "用户ID")
	private String userId;
    /**
     * 考试ID
     */
	@Schema(description = "考试ID")
	private String examId;
    /**
     * 量表
     */
	@Schema(description = "量表")
	private String repoId;
	/**
	 * 加减乘除
	 */
	@Schema(description = "加减乘除")
	private Integer number;
	/**
	 * 加减乘除
	 */
	@Schema(description = "加减乘除")
	private Integer ruleType;
    /**
     * 规则描述
     */
	@Schema(description = "规则描述")
	private String content;
    /**
     * 题目ID聚合
     */
	@Schema(description = "题目ID聚合")
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
     * 创建时间
     */
	@Schema(description = "创建时间")
	private Date createTime;
    /**
     * 更新时间
     */
	@Schema(description = "更新时间")
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
}