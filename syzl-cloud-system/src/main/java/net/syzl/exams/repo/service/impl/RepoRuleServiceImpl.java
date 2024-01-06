package net.syzl.exams.repo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.repo.dto.RepoRuleDTO;
import net.syzl.exams.repo.entity.RepoRule;
import net.syzl.exams.repo.mapper.RepoRuleMapper;
import net.syzl.exams.repo.service.RepoRuleService;
import org.springframework.stereotype.Service;

/**
 * 量表规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@Service
public class RepoRuleServiceImpl extends ServiceImpl<RepoRuleMapper, RepoRule> implements RepoRuleService {


    @Override
    public IPage<RepoRuleDTO> paging(PagingReqDTO<RepoRuleDTO> reqDTO) {
        return baseMapper.paging(reqDTO.toPage(), reqDTO.getParams());
    }

    @Override
    public void batchAction(RepoRuleDTO reqDTO) {

    }
}