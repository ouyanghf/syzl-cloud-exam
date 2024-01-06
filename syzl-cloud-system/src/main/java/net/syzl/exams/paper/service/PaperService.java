package net.syzl.exams.paper.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.paper.dto.PaperDTO;
import net.syzl.exams.paper.dto.ext.PaperQuDetailDTO;
import net.syzl.exams.paper.dto.request.PaperAnswerDTO;
import net.syzl.exams.paper.dto.request.PaperListReqDTO;
import net.syzl.exams.paper.dto.response.ExamDetailRespDTO;
import net.syzl.exams.paper.dto.response.ExamResultRespDTO;
import net.syzl.exams.paper.dto.response.PaperListRespDTO;
import net.syzl.exams.paper.entity.Paper;

/**
* <p>
* 试卷业务类
* </p>
*
* @author admin
* @since 2020-05-25 16:33
*/
public interface PaperService extends IService<Paper> {

    /**
     * 创建试卷
     * @param userId
     * @param examId
     * @return
     */
    String createPaper(String userId, String examId);


    /**
     * 查找详情
     * @param paperId
     * @return
     */
    ExamDetailRespDTO paperDetail(String paperId);

    /**
     * 检测结果
     * @param paperId
     * @return
     */
    ExamResultRespDTO paperResult(String paperId);

    /**
     * 查找题目详情
     * @param paperId
     * @param quId
     * @return
     */
    PaperQuDetailDTO findQuDetail(String paperId, String quId);

    /**
     * 填充答案
     * @param reqDTO
     */
    void fillAnswer(PaperAnswerDTO reqDTO);

    /**
     * 交卷操作
     * @param paperId
     * @return
     */
    void handExam(String paperId);

    /**
     * 试卷列表响应类
     * @param reqDTO
     * @return
     */
    IPage<PaperListRespDTO> paging(PagingReqDTO<PaperListReqDTO> reqDTO);

    /**
     * 检测是否有进行中的检测
     * @param userId
     * @return
     */
    PaperDTO checkProcess(String userId);

}
