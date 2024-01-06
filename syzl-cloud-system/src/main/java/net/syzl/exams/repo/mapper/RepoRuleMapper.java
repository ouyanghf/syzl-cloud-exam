package net.syzl.exams.repo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.repo.dto.RepoRuleDTO;
import net.syzl.exams.repo.entity.RepoRule;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 量表规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Mapper
public interface RepoRuleMapper extends BaseMapper<RepoRule> {

    IPage<RepoRuleDTO> paging(Page toPage,@Param("query") RepoRuleDTO params);
}