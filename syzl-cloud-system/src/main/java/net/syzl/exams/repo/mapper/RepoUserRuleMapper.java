package net.syzl.exams.repo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.syzl.exams.repo.entity.RepoUserRule;
import org.apache.ibatis.annotations.Mapper;

/**
 * 量表用户规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Mapper
public interface RepoUserRuleMapper extends BaseMapper<RepoUserRule> {
	
}