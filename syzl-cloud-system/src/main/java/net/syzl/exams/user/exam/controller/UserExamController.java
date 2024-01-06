package net.syzl.exams.user.exam.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.syzl.exams.core.api.ApiRest;
import net.syzl.exams.core.api.controller.BaseController;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.user.exam.dto.request.UserExamReqDTO;
import net.syzl.exams.user.exam.dto.response.UserExamRespDTO;
import net.syzl.exams.user.exam.service.UserExamService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
* <p>
* 检测记录控制器
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/
@Tag(name ="检测记录")
@RestController
@RequestMapping("/exam/api/user/exam")
public class UserExamController extends BaseController {

    @Autowired
    private UserExamService baseService;


    /**
     * 分页查找
     * @param reqDTO
     * @return
     */
    @Operation(summary ="分页查找")
    @RequestMapping(value = "/paging", method = { RequestMethod.POST})
    public ApiRest<IPage<UserExamRespDTO>> paging(@RequestBody PagingReqDTO<UserExamReqDTO> reqDTO) {

        //分页查询并转换
        IPage<UserExamRespDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }


    /**
    * 分页查找
    * @param reqDTO
    * @return
    */
    @Operation(summary ="分页查找")
    @RequestMapping(value = "/my-paging", method = { RequestMethod.POST})
    public ApiRest<IPage<UserExamRespDTO>> myPaging(@RequestBody PagingReqDTO<UserExamReqDTO> reqDTO) {

        //分页查询并转换
        IPage<UserExamRespDTO> page = baseService.myPaging(reqDTO);

        return super.success(page);
    }
}
