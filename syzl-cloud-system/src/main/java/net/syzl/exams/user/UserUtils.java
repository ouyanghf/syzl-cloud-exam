package net.syzl.exams.user;

import net.syzl.exams.core.api.ApiError;
import net.syzl.exams.core.exception.ServiceException;
import net.syzl.framework.common.constant.Constant;
import net.syzl.framework.security.user.SecurityUser;
import net.syzl.framework.security.user.UserDetail;

/**
 * 用户静态工具类
 * @author bool
 */
public class UserUtils {


    /**
     * 获取当前登录用户的ID
     * @param throwable
     * @return
     */
    public static String getUserId(boolean throwable){
        try {
            UserDetail user = SecurityUser.getUser();
            if (user != null) {
                return   user.getId()+"";

            }
            return "";
        }catch (Exception e){
            if(throwable){
                throw new ServiceException(ApiError.ERROR_10010002);
            }
            return null;
        }
    }

    /**
     * 获取当前登录用户的ID
     * @param throwable
     * @return
     */
    public static boolean isAdmin(boolean throwable){
        try {
            UserDetail user = SecurityUser.getUser();
            if (user.getSuperAdmin().equals(Constant.SUPER_ADMIN)) {
                return true;
            }
              return false;
        }catch (Exception e){
            if(throwable){
                throw new ServiceException(ApiError.ERROR_10010002);
            }
        }

        return false;
    }

    /**
     * 获取当前登录用户的ID，默认是会抛异常的
     * @return
     */
    public static String getUserId(){
        return getUserId(true);
    }
}
