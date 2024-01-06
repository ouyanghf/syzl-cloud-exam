package net.syzl.exams.paper.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.syzl.exams.paper.dto.PaperDTO;
import net.syzl.exams.paper.dto.request.PaperListReqDTO;
import net.syzl.exams.paper.dto.response.PaperListRespDTO;
import net.syzl.exams.paper.entity.Paper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 试卷Mapper
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/
@Mapper
public interface PaperMapper extends BaseMapper<Paper> {

    /**
     * 查找试卷分页
     * @param page
     * @param query
     * @return
     */
    IPage<PaperListRespDTO> paging(Page page, @Param("query") PaperListReqDTO query);


    /**
     * 试卷列表响应类
     * @param query
     * @return
     */
    List<PaperListRespDTO> list(@Param("query") PaperDTO query);
}
