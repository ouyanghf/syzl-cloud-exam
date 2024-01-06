package net.syzl.exams.repo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.repo.dto.RepoUserRuleDTO;
import net.syzl.exams.repo.entity.RepoUserRule;

/**
 * 量表用户规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
public interface RepoUserRuleService extends IService<RepoUserRule> {

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
    IPage<RepoUserRuleDTO> paging(PagingReqDTO<RepoUserRuleDTO> reqDTO);

    /**
     * 批量操作
     * @param reqDTO
     */
    void batchAction(RepoUserRuleDTO reqDTO);
}