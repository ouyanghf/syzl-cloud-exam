package net.syzl.exams.repo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.repo.dto.RepoRuleDTO;
import net.syzl.exams.repo.entity.RepoRule;

/**
 * 量表规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
public interface RepoRuleService extends IService<RepoRule> {

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
    IPage<RepoRuleDTO> paging(PagingReqDTO<RepoRuleDTO> reqDTO);

    /**
     * 批量操作
     * @param reqDTO
     */
    void batchAction(RepoRuleDTO reqDTO);
}