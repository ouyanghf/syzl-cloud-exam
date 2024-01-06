package net.syzl.exams.paper.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.syzl.exams.core.api.ApiRest;
import net.syzl.exams.core.api.controller.BaseController;
import net.syzl.exams.core.api.dto.BaseIdReqDTO;
import net.syzl.exams.core.api.dto.BaseIdRespDTO;
import net.syzl.exams.core.api.dto.BaseIdsReqDTO;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.paper.dto.PaperDTO;
import net.syzl.exams.paper.dto.ext.PaperQuDetailDTO;
import net.syzl.exams.paper.dto.request.PaperAnswerDTO;
import net.syzl.exams.paper.dto.request.PaperCreateReqDTO;
import net.syzl.exams.paper.dto.request.PaperListReqDTO;
import net.syzl.exams.paper.dto.request.PaperQuQueryDTO;
import net.syzl.exams.paper.dto.response.ExamDetailRespDTO;
import net.syzl.exams.paper.dto.response.ExamResultRespDTO;
import net.syzl.exams.paper.dto.response.PaperListRespDTO;
import net.syzl.exams.paper.entity.Paper;
import net.syzl.exams.paper.service.PaperService;
import net.syzl.exams.user.UserUtils;
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
* 试卷控制器
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/
@Tag(name ="试卷")
@RestController
@RequestMapping("/exam/api/paper/paper")
public class PaperController extends BaseController {

    @Autowired
    private PaperService baseService;

    /**
    * 添加或修改
    * @param reqDTO
    * @return
    */
    @Operation(summary ="添加或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST})
    public ApiRest<BaseIdRespDTO> save(@RequestBody PaperDTO reqDTO) {
        //复制参数
        Paper entity = new Paper();
        BeanMapper.copy(reqDTO, entity);
        baseService.saveOrUpdate(entity);
        return super.success(new BaseIdRespDTO(entity.getId()));
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
    public ApiRest<PaperDTO> find(@RequestBody BaseIdReqDTO reqDTO) {
        Paper entity = baseService.getById(reqDTO.getId());
        PaperDTO dto = new PaperDTO();
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
    public ApiRest<IPage<PaperListRespDTO>> paging(@RequestBody PagingReqDTO<PaperListReqDTO> reqDTO) {

        //分页查询并转换
        IPage<PaperListRespDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }



    /**
     * 创建试卷
     * @param reqDTO
     * @return
     */
    @Operation(summary ="创建试卷")
    @RequestMapping(value = "/create-paper", method = { RequestMethod.POST})
    public ApiRest<BaseIdRespDTO> save(@RequestBody PaperCreateReqDTO reqDTO) {
        //复制参数
        String paperId = baseService.createPaper(UserUtils.getUserId(), reqDTO.getExamId());
        return super.success(new BaseIdRespDTO(paperId));
    }

    /**
     * 批量删除
     * @param reqDTO
     * @return
     */
    @Operation(summary ="试卷详情")
    @RequestMapping(value = "/paper-detail", method = { RequestMethod.POST})
    public ApiRest<ExamDetailRespDTO> paperDetail(@RequestBody BaseIdReqDTO reqDTO) {
        //根据ID删除
        ExamDetailRespDTO respDTO = baseService.paperDetail(reqDTO.getId());
        return super.success(respDTO);
    }

    /**
     * 批量删除
     * @param reqDTO
     * @return
     */
    @Operation(summary ="试题详情")
    @RequestMapping(value = "/qu-detail", method = { RequestMethod.POST})
    public ApiRest<PaperQuDetailDTO> quDetail(@RequestBody PaperQuQueryDTO reqDTO) {
        //根据ID删除
        PaperQuDetailDTO respDTO = baseService.findQuDetail(reqDTO.getPaperId(), reqDTO.getQuId());
        return super.success(respDTO);
    }

    /**
     * 填充答案
     * @param reqDTO
     * @return
     */
    @Operation(summary ="填充答案")
    @RequestMapping(value = "/fill-answer", method = { RequestMethod.POST})
    public ApiRest<PaperQuDetailDTO> fillAnswer(@RequestBody PaperAnswerDTO reqDTO) {
        //根据ID删除
        baseService.fillAnswer(reqDTO);
        return super.success();
    }


    /**
     * 交卷操作
     * @param reqDTO
     * @return
     */
    @Operation(summary ="交卷操作")
    @RequestMapping(value = "/hand-exam", method = { RequestMethod.POST})
    public ApiRest<PaperQuDetailDTO> handleExam(@RequestBody BaseIdReqDTO reqDTO) {
        //根据ID删除
        baseService.handExam(reqDTO.getId());
        return super.success();
    }


    /**
     * 批量删除
     * @param reqDTO
     * @return
     */
    @Operation(summary ="试卷详情")
    @RequestMapping(value = "/paper-result", method = { RequestMethod.POST})
    public ApiRest<ExamResultRespDTO> paperResult(@RequestBody BaseIdReqDTO reqDTO) {
        //根据ID删除
        ExamResultRespDTO respDTO = baseService.paperResult(reqDTO.getId());
        return super.success(respDTO);
    }


    /**
     * 检测用户有没有中断的检测
     * @return
     */
    @Operation(summary ="检测进行中的检测")
    @RequestMapping(value = "/check-process", method = { RequestMethod.POST})
    public ApiRest<PaperDTO> checkProcess() {
        //复制参数
        PaperDTO dto = baseService.checkProcess(UserUtils.getUserId());
        return super.success(dto);
    }
}
