package net.syzl.exams.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.syzl.exams.exam.entity.ExamDepart;

import java.util.List;

/**
* <p>
* 检测部门业务类
* </p>
*
* @author admin
* @since 2020-09-03 17:24
*/
public interface ExamDepartService extends IService<ExamDepart> {

    /**
     * 保存全部
     * @param examId
     * @param departs
     */
    void saveAll(String examId, List<String> departs);


    /**
     * 根据检测查找对应的部门
     * @param examId
     * @return
     */
    List<String> listByExam(String examId);
}
