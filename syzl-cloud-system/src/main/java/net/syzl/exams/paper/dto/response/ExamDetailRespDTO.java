package net.syzl.exams.paper.dto.response;

import net.syzl.exams.paper.dto.PaperDTO;
import net.syzl.exams.paper.dto.PaperQuDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Calendar;
import java.util.List;

@Data
@Schema(name ="检测详情", description="检测详情")
public class ExamDetailRespDTO extends PaperDTO {


    @Schema(description = "单选题列表", required=true)
    private List<PaperQuDTO> radioList;

    @Schema(description = "多选题列表", required=true)
    private List<PaperQuDTO> multiList;

    @Schema(description = "判断题", required=true)
    private List<PaperQuDTO> judgeList;


    @Schema(description = "剩余结束秒数", required=true)
    public Long getLeftSeconds(){

        // 结束时间
        Calendar cl = Calendar.getInstance();
        if(null!=this.getCreateTime()) {
            cl.setTime(this.getCreateTime());
            cl.add(Calendar.MINUTE, getTotalTime());

        }
        return (cl.getTimeInMillis() - System.currentTimeMillis()) / 1000;
    }

}
