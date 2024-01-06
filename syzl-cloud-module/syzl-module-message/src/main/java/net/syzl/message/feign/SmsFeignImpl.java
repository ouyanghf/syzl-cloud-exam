package net.syzl.message.feign;

import lombok.AllArgsConstructor;
import net.syzl.api.feign.message.SmsFeign;
import net.syzl.message.cache.SmsSendCache;
import net.syzl.message.sms.service.SmsService;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 短信服务
 *
 *  @author admin
 */
@RestController
@AllArgsConstructor
public class SmsFeignImpl implements SmsFeign {
    private final SmsService smsService;
    private final SmsSendCache smsSendCache;

    @Override
    public Boolean send(String mobile, Map<String, String> params) {
        return smsService.send(mobile, params);
    }

    @Override
    public Boolean sendCode(String mobile, String key, String value) {
        // 短信参数
        Map<String, String> params = new HashMap<>();
        params.put(key, value);

        // 发送短信
        boolean flag = smsService.send(mobile, params);
        if (flag) {
            smsSendCache.saveCode(mobile, value);
        }
        return flag;
    }
}
