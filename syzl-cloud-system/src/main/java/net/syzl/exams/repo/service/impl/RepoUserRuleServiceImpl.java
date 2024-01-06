package net.syzl.exams.repo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.repo.dto.RepoUserRuleDTO;
import net.syzl.exams.repo.entity.RepoUserRule;
import net.syzl.exams.repo.mapper.RepoUserRuleMapper;
import net.syzl.exams.repo.service.RepoUserRuleService;
import org.springframework.stereotype.Service;

/**
 * 量表用户规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Service
public class RepoUserRuleServiceImpl extends ServiceImpl<RepoUserRuleMapper, RepoUserRule> implements RepoUserRuleService {

    @Override
    public IPage<RepoUserRuleDTO> paging(PagingReqDTO<RepoUserRuleDTO> reqDTO) {
        return null;
    }

    @Override
    public void batchAction(RepoUserRuleDTO reqDTO) {

    }

}