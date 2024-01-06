package net.syzl.exams.repo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.repo.dto.RepoDTO;
import net.syzl.exams.repo.dto.request.RepoReqDTO;
import net.syzl.exams.repo.dto.response.RepoRespDTO;
import net.syzl.exams.repo.entity.Repo;

/**
* <p>
* 量表业务类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
public interface RepoService extends IService<Repo> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<RepoRespDTO> paging(PagingReqDTO<RepoReqDTO> reqDTO);


    /**
     * 保存
     * @param reqDTO
     */
    void save(RepoDTO reqDTO);
}
