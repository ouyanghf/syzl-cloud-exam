package net.syzl.message.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.common.utils.Result;
import net.syzl.message.convert.SmsLogConvert;
import net.syzl.message.entity.SmsLogEntity;
import net.syzl.message.query.SmsLogQuery;
import net.syzl.message.service.SmsLogService;
import net.syzl.message.vo.SmsLogVO;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 短信日志
 *
 * @author syzl 
 */
@RestController
@RequestMapping("message/sms/log")
@Tag(name = "短信日志")
@AllArgsConstructor
public class SmsLogController {
    private final SmsLogService smsLogService;

    @GetMapping("page")
    @Operation(summary = "分页")
    @PreAuthorize("hasAuthority('sms:log')")
    public Result<PageResult<SmsLogVO>> page(@ParameterObject @Valid SmsLogQuery query) {
        PageResult<SmsLogVO> page = smsLogService.page(query);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @Operation(summary = "信息")
    @PreAuthorize("hasAuthority('sms:log')")
    public Result<SmsLogVO> get(@PathVariable("id") Long id) {
        SmsLogEntity entity = smsLogService.getById(id);

        return Result.ok(SmsLogConvert.INSTANCE.convert(entity));
    }

}