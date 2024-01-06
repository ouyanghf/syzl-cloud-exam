package net.syzl.system.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import net.syzl.framework.common.query.Query;

/**
 * 字典类型
 *
 * @author admin 
 * 
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "字典类型查询")
public class SysDictTypeQuery extends Query {
    @Schema(description = "字典类型")
    private String dictType;

    @Schema(description = "字典名称")
    private String dictName;

}
