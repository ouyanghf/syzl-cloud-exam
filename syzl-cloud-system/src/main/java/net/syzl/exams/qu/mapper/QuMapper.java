package net.syzl.exams.qu.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.qu.dto.QuDTO;
import net.syzl.exams.qu.dto.export.QuExportDTO;
import net.syzl.exams.qu.dto.request.QuQueryReqDTO;
import net.syzl.exams.qu.dto.request.QuRepoSelectDTO;
import net.syzl.exams.qu.entity.Qu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 问题题目Mapper
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/@Mapper
public interface QuMapper extends BaseMapper<Qu> {



    /**
     * 随机抽取量表的数据
     * @param repoId
     * @param quType
     * @param excludes 要排除的ID列表
     * @param size
     * @return
     */
    List<Qu> listByRandom(@Param("repoId") String repoId,
                          @Param("quType") Integer quType,
                          @Param("excludes") List<String> excludes,
                          @Param("size") Integer size);
    List<Qu> listByRepoId(@Param("repoId") String repoId);

    /**
     * 查找导出列表
     * @param query
     * @return
     */
    List<QuExportDTO> listForExport(@Param("query") QuQueryReqDTO query);

    /**
     * 分页查找
     * @param page
     * @param query
     * @return
     */
    IPage<QuDTO> paging(Page page, @Param("query") QuQueryReqDTO query);

    IPage<QuDTO> quSelect(Page page, @Param("query") QuRepoSelectDTO query);


}
