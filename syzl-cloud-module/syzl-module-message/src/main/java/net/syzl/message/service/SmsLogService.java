package net.syzl.message.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.message.entity.SmsLogEntity;
import net.syzl.message.query.SmsLogQuery;
import net.syzl.message.vo.SmsLogVO;

/**
 * 短信日志
 *
 * @author syzl 
 */
public interface SmsLogService extends BaseService<SmsLogEntity> {

    PageResult<SmsLogVO> page(SmsLogQuery query);

}