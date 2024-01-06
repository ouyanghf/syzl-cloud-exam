package net.syzl.exams.qu.dto.export;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.util.List;

/**
 * 用于导出的数据结构
 * @author bool
 */
@Data
public class QuExportDTO {

    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private String qId;

     @ExcelProperty("题目序号")
    private String no;
     @ExcelProperty("题目类型")
    private String quType;
     @ExcelProperty("题目内容")
    private String qContent;
     @ExcelProperty("整体解析")
    private String qAnalysis;
     @ExcelProperty("题目图片")
    private String qImage;
     @ExcelProperty("题目视频")
    private String qVideo;
     @ExcelProperty("所属量表")
    private List<String> repoList;
     @ExcelProperty("是否正确项")
    private String aIsRight;
     @ExcelProperty("选项内容")
    private String aContent;
     @ExcelProperty("选项解析")
    private String aAnalysis;
     @ExcelProperty("选项图片")
    private String aImage;
     @ExcelProperty("选项分数")
    private String aItemScore;
}
