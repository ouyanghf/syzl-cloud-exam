package net.syzl.framework.operatelog.service;

import lombok.AllArgsConstructor;
import net.syzl.framework.common.cache.RedisCache;
import net.syzl.framework.common.cache.RedisKeys;
import net.syzl.framework.operatelog.dto.OperateLogDTO;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * 操作日志服务
 *
 * @author admin
 * 
 */
@Service
@AllArgsConstructor
public class OperateLogService {
    private final RedisCache redisCache;

    @Async
    public void saveLog(OperateLogDTO log) {
        String key = RedisKeys.getLogKey();

        // 保存到Redis队列
        redisCache.leftPush(key, log, RedisCache.NOT_EXPIRE);
    }
}
