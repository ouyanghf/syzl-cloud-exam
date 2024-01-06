package net.syzl.system.service;

import net.syzl.system.vo.AccessTokenVO;
import net.syzl.system.vo.SysAccountLoginVO;
import net.syzl.system.vo.SysMobileLoginVO;
import net.syzl.system.vo.SysUserTokenVO;

/**
 * 权限认证服务
 *
 * @author admin 
 * 
 */
public interface SysAuthService {

    /**
     * 账号密码登录
     *
     * @param login 登录信息
     */
    SysUserTokenVO loginByAccount(SysAccountLoginVO login);

    /**
     * 手机短信登录
     *
     * @param login 登录信息
     */
    SysUserTokenVO loginByMobile(SysMobileLoginVO login);

    /**
     * 发送手机验证码
     *
     * @param mobile 手机号
     */
    boolean sendCode(String mobile);

    /**
     * 根据刷新Token，获取AccessToken
     *
     * @param refreshToken refreshToken
     */
    AccessTokenVO getAccessToken(String refreshToken);

    /**
     * 退出登录
     *
     * @param accessToken accessToken
     */
    void logout(String accessToken);
}
