package net.syzl.exams.repo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.syzl.exams.core.api.ApiRest;
import net.syzl.exams.core.api.controller.BaseController;
import net.syzl.exams.core.api.dto.BaseIdReqDTO;
import net.syzl.exams.core.api.dto.BaseIdsReqDTO;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.qu.dto.request.QuRepoBatchReqDTO;
import net.syzl.exams.qu.service.QuRepoService;
import net.syzl.exams.repo.dto.RepoDTO;
import net.syzl.exams.repo.dto.request.RepoReqDTO;
import net.syzl.exams.repo.dto.response.RepoRespDTO;
import net.syzl.exams.repo.entity.Repo;
import net.syzl.exams.repo.service.RepoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
* <p>
* 量表控制器
* </p>
*
* @author admin
* @since 2020-05-25 13:25
*/
@Tag(name ="量表")
@RestController
@RequestMapping("/exam/api/repo")
public class RepoController extends BaseController {

    @Autowired
    private RepoService baseService;

    @Autowired
    private QuRepoService quRepoService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @Operation(summary ="添加或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST})
    public ApiRest save(@RequestBody RepoDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
    * 批量删除
    * @param reqDTO
    * @return
    */
    @Operation(summary ="批量删除")
    @RequestMapping(value = "/delete", method = { RequestMethod.POST})
    public ApiRest edit(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.removeByIds(reqDTO.getIds());
        return super.success();
    }

    /**
    * 查找详情
    * @param reqDTO
    * @return
    */
    @Operation(summary ="查找详情")
    @RequestMapping(value = "/detail", method = { RequestMethod.POST})
    public ApiRest<RepoDTO> find(@RequestBody BaseIdReqDTO reqDTO) {
        Repo entity = baseService.getById(reqDTO.getId());
        RepoDTO dto = new RepoDTO();
        BeanUtils.copyProperties(entity, dto);
        return super.success(dto);
    }

    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @Operation(summary ="分页查找")
    @RequestMapping(value = "/paging", method = { RequestMethod.POST})
    public ApiRest<IPage<RepoRespDTO>> paging(@RequestBody PagingReqDTO<RepoReqDTO> reqDTO) {

        //分页查询并转换
        IPage<RepoRespDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 批量操作
     * @param reqDTO
     * @return
     */
    @Operation(summary ="批量加入或从量表移除")
    @RequestMapping(value = "/batch-action", method = { RequestMethod.POST})
    public ApiRest batchAction(@RequestBody QuRepoBatchReqDTO reqDTO) {

        //分页查询并转换
        quRepoService.batchAction(reqDTO);
        return super.success();
    }
}
