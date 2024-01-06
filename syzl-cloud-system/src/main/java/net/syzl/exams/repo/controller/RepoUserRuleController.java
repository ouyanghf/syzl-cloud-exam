package net.syzl.exams.repo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.syzl.exams.core.api.ApiRest;
import net.syzl.exams.core.api.controller.BaseController;
import net.syzl.exams.core.api.dto.BaseIdReqDTO;
import net.syzl.exams.core.api.dto.BaseIdsReqDTO;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.repo.dto.RepoUserRuleDTO;
import net.syzl.exams.repo.entity.RepoUserRule;
import net.syzl.exams.repo.service.RepoUserRuleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * 量表用户规则
 *
 * @author Mark oooo@gmail.com
 * @since 1.0.0 2023-12-02
 */
@RestController
@RequestMapping("/exam/api/repouserrule")
@Tag(name ="量表用户规则")
public class RepoUserRuleController  extends BaseController {

    @Autowired
    private RepoUserRuleService baseService;


    /**
     * 添加或修改
     * @param reqDTO
     * @return
     */
    @Operation(summary ="添加或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST})
    public ApiRest save(@RequestBody RepoUserRuleDTO reqDTO) {
        //复制参数
        RepoUserRule entity = new RepoUserRule();
        BeanMapper.copy(reqDTO, entity);
        baseService.save(entity);
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
    public ApiRest<RepoUserRuleDTO> find(@RequestBody BaseIdReqDTO reqDTO) {
        RepoUserRule entity = baseService.getById(reqDTO.getId());
        RepoUserRuleDTO dto = new RepoUserRuleDTO();
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
    public ApiRest<IPage<RepoUserRuleDTO>> paging(@RequestBody PagingReqDTO<RepoUserRuleDTO> reqDTO) {

        //分页查询并转换
        IPage<RepoUserRuleDTO>  page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 批量操作
     * @param reqDTO
     * @return
     */
    @Operation(summary = "批量加入或从量表移除")
    @RequestMapping(value = "/batch-action", method = { RequestMethod.POST})
    public ApiRest batchAction(@RequestBody RepoUserRuleDTO reqDTO) {

        //分页查询并转换
        baseService.batchAction(reqDTO);
        return super.success();
    }

}