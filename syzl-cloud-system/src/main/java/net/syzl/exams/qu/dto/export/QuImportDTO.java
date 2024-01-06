package net.syzl.exams.qu.dto.export;

import net.syzl.exams.qu.dto.QuAnswerDTO;
import lombok.Data;

import java.util.List;

/**
 * 用于导出的数据结构
 * @author bool
 */
@Data
public class QuImportDTO {

    private static final long serialVersionUID = 1L;

    private String quType;
    private String qContent;
    private String qAnalysis;
    private String qImage;
    private String repoName;
    private List<QuAnswerDTO> answerList;
}
