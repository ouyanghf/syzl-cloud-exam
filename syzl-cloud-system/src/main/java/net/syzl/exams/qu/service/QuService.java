package net.syzl.exams.qu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.qu.dto.QuDTO;
import net.syzl.exams.qu.dto.export.QuExportDTO;
import net.syzl.exams.qu.dto.export.TiExportDTO;
import net.syzl.exams.qu.dto.ext.QuDetailDTO;
import net.syzl.exams.qu.dto.request.QuQueryReqDTO;
import net.syzl.exams.qu.dto.request.QuRepoSelectDTO;
import net.syzl.exams.qu.entity.Qu;

import java.util.List;

/**
* <p>
* 问题题目业务类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
public interface QuService extends IService<Qu> {

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
  //  @Cacheable(value = "QuQueryReqDTO")
    IPage<QuDTO> paging(PagingReqDTO<QuQueryReqDTO> reqDTO);

    /**
     * 删除试题
     * @param ids
     */
    void delete(List<String> ids);

    /**
     * 随机抽取量表的数据
     * @param repoId
     * @param quType
     * @param level  难度等级
     * @param excludes 要排除的ID列表
     * @param size
     * @return
     */
    List<Qu> listByRandom(String repoId,
                          Integer quType,
                          List<String> excludes,
                          Integer size);


    List<Qu> listByRepoId(String repoId);
    /**
     * 问题详情
     * @param id
     * @return
     */
    QuDetailDTO detail(String id);

    /**
     * 保存试题
     * @param reqDTO
     */
    void save(QuDetailDTO reqDTO);

    /**
     * 查找导出列表
     * @param query
     * @return
     */
    List<QuExportDTO> listForExport(QuQueryReqDTO query);

    /**
     * 导入Excel
     * @param dtoList
     * @return
     */
    int importExcel(List<QuExportDTO> dtoList);
    /**
     * 导入Excel
     * @param dtoList
     * @return
     */
    int importTi(List<TiExportDTO> dtoList);

    IPage<QuDTO> quSelect(PagingReqDTO<QuRepoSelectDTO> reqDTO);
}
