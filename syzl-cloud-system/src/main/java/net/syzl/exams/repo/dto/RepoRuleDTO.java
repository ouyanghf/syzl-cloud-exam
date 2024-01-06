package net.syzl.exams.repo.dto;

import net.syzl.exams.qu.dto.QuDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 量表规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Data
@Schema(description = "量表规则")
public class RepoRuleDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@Schema(description = "ID")
	private String id;

	@Schema(description = "规则名称")
	private String title;

	@Schema(description = "量表ID")
	private String repoId;

	@Schema(description = "加减乘除")
	private Integer number;

	@Schema(description = "加减乘除")
	private Integer ruleType;
	@Schema(description = "规则描述")
	private String content;

	@Schema(description = "题目ID聚合")
	private  List<String>   quIds;

	@Schema(description = "题号聚合")
	private  List<String>  nos;

	private List<QuDTO> quObjs;

	@Schema(description = "考试状态")
	private Integer state;

	@Schema(description = "创建时间")
	private Date createTime;

	@Schema(description = "更新时间")
	private Date updateTime;

	@Schema(description = "总分数")
	private String totalScore;

	@Schema(description = "得分数")
	private String score;


}