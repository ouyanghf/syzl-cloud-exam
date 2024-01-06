package net.syzl.exams.qu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.qu.dto.QuRepoDTO;
import net.syzl.exams.qu.dto.request.QuRepoBatchReqDTO;
import net.syzl.exams.qu.entity.QuRepo;

import java.util.List;

/**
* <p>
* 试题量表业务类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
public interface QuRepoService extends IService<QuRepo> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<QuRepoDTO> paging(PagingReqDTO<QuRepoDTO> reqDTO);

    /**
     * 保存全部列表
     * @param quId
     * @param quType
     * @param ids
     */
    void saveAll(String quId, Integer quType, List<String> ids);

    /**
     * 根据问题查找量表
     * @param quId
     * @return
     */
    List<String> listByQu(String quId);

    /**
     * 根据量表查找题目ID列表
     * @param repoId
     * @param quType
     * @param rand
     * @return
     */
    List<String> listByRepo(String repoId, Integer quType, boolean rand);

    /**
     * 批量操作
     * @param reqDTO
     */
    void batchAction(QuRepoBatchReqDTO reqDTO);

}
