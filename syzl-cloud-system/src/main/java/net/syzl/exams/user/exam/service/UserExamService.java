package net.syzl.exams.user.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.user.exam.dto.request.UserExamReqDTO;
import net.syzl.exams.user.exam.dto.response.UserExamRespDTO;
import net.syzl.exams.user.exam.entity.UserExam;

/**
* <p>
* 检测记录业务类
* </p>
*
* @author admin
* @since 2020-09-21 15:13
*/
public interface UserExamService extends IService<UserExam> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<UserExamRespDTO> paging(PagingReqDTO<UserExamReqDTO> reqDTO);

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
    IPage<UserExamRespDTO> myPaging(PagingReqDTO<UserExamReqDTO> reqDTO);


    /**
     * 检测完成后加入成绩
     * @param userId
     * @param examId
     * @param score
     * @param passed
     */
    void joinResult(String userId, String examId, Integer score, boolean passed);
}
