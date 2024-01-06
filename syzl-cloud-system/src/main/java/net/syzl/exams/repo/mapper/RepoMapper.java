package net.syzl.exams.repo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.repo.dto.request.RepoReqDTO;
import net.syzl.exams.repo.dto.response.RepoRespDTO;
import net.syzl.exams.repo.entity.Repo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
* <p>
* 量表Mapper
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/@Mapper
public interface RepoMapper extends BaseMapper<Repo> {

    /**
     * 分页查询量表
     * @param page
     * @param query
     * @return
     */
    IPage<RepoRespDTO> paging(Page page, @Param("query") RepoReqDTO query);

}
