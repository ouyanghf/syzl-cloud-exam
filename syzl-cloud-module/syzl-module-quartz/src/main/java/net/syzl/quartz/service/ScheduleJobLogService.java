package net.syzl.quartz.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.quartz.entity.ScheduleJobLogEntity;
import net.syzl.quartz.query.ScheduleJobLogQuery;
import net.syzl.quartz.vo.ScheduleJobLogVO;

/**
 * 定时任务日志
 *
 * @author syzl 
 */
public interface ScheduleJobLogService extends BaseService<ScheduleJobLogEntity> {

    PageResult<ScheduleJobLogVO> page(ScheduleJobLogQuery query);

}