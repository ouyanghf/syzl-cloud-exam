package net.syzl.exams.qu.dto.export;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/**
 * 用于导出的数据结构
 * @author bool
 */
@Data
public class TiExportDTO {
    private static final long serialVersionUID = 1L;
     @ExcelProperty("题目序号")
    private String no;
     @ExcelProperty("所属量表")
    private String repoNo;
     @ExcelProperty("题目内容")
    private String content;
     @ExcelProperty("A选项")
    private String aContent; 
     @ExcelProperty("A选项分数")
    private String aItemScore;    
     @ExcelProperty("B选项")
    private String bContent;
     @ExcelProperty("B选项分数")
    private String bItemScore;
     @ExcelProperty("C选项")
    private String cContent;
     @ExcelProperty("C选项分数")
    private String cItemScore;
     @ExcelProperty("D选项")
    private String dContent;
     @ExcelProperty("D选项分数")
    private String dItemScore;
     @ExcelProperty("E选项")
    private String eContent;
     @ExcelProperty("E选项分数")
    private String eItemScore;
}
