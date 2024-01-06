package net.syzl.exams.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.exam.dto.ExamDTO;
import net.syzl.exams.exam.dto.request.ExamSaveReqDTO;
import net.syzl.exams.exam.dto.response.ExamOnlineRespDTO;
import net.syzl.exams.exam.dto.response.ExamReviewRespDTO;
import net.syzl.exams.exam.entity.Exam;

import java.util.List;

/**
* <p>
* 检测业务类
* </p>
*
* @author admin
* @since 2020-07-25 16:18
*/
public interface ExamService extends IService<Exam> {

    /**
     * 保存检测信息
     * @param reqDTO
     */
    void save(ExamSaveReqDTO reqDTO);

    /**
     * 查找检测详情
     * @param id
     * @return
     */
    ExamSaveReqDTO findDetail(String id);

    /**
     * 查找检测详情--简要信息
     * @param id
     * @return
     */
    ExamDTO findById(String id);

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<ExamDTO> paging(PagingReqDTO<ExamDTO> reqDTO);


    /**
     * 在线检测分页响应类-考生视角
     * @param reqDTO
     * @return
     */
    IPage<ExamOnlineRespDTO> onlinePaging(PagingReqDTO<ExamDTO> reqDTO);


    /**
     * 待阅试卷列表
     * @param reqDTO
     * @return
     */
    IPage<ExamReviewRespDTO> reviewPaging(PagingReqDTO<ExamDTO> reqDTO);

    List<ExamOnlineRespDTO> onlineExam(String userId);
}
