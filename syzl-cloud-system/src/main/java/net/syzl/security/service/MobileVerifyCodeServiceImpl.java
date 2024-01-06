package net.syzl.security.service;

import lombok.AllArgsConstructor;
import net.syzl.api.module.message.SmsApi;
import net.syzl.framework.security.mobile.MobileVerifyCodeService;
import org.springframework.stereotype.Service;

/**
 * 短信验证码效验
 *
 * @author admin 
 * 
 */
@Service
@AllArgsConstructor
public class MobileVerifyCodeServiceImpl implements MobileVerifyCodeService {
    private final SmsApi smsApi;

    @Override
    public boolean verifyCode(String mobile, String code) {
        return smsApi.verifyCode(mobile, code);
    }
}
