package net.syzl.exams.core.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 主键通用响应类，用于添加后返回内容
 * </p>
 *
 * @author admin
 * @since 2019-04-20 12:15
 */
@Data
@Schema(name ="主键通用响应类", description="主键通用响应类")
@AllArgsConstructor
@NoArgsConstructor
public class BaseIdRespDTO extends BaseDTO {

    @Schema(description = "主键ID", required=true)
    private String id;
}
