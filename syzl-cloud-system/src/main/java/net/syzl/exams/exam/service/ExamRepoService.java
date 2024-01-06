package net.syzl.exams.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.exam.dto.ext.ExamRepoExtDTO;
import net.syzl.exams.exam.entity.ExamRepo;

import java.util.List;

/**
* <p>
* 检测量表业务类
* </p>
*
* @author admin
* @since 2020-09-05 11:14
*/
public interface ExamRepoService extends IService<ExamRepo> {


    /**
     * 保存全部
     * @param examId
     * @param list
     */
    void saveAll(String examId, List<ExamRepoExtDTO> list);

    /**
     * 查找检测量表列表
     * @param examId
     * @return
     */
    List<ExamRepoExtDTO> listByExam(String examId);

    /**
     * 清理脏数据
     * @param examId
     */
    void clear(String examId);

}
