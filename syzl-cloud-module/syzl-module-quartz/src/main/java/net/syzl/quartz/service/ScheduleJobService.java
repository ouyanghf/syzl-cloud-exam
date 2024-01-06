package net.syzl.quartz.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.quartz.entity.ScheduleJobEntity;
import net.syzl.quartz.query.ScheduleJobQuery;
import net.syzl.quartz.vo.ScheduleJobVO;

import java.util.List;

/**
 * 定时任务
 *
 * @author syzl 
 */
public interface ScheduleJobService extends BaseService<ScheduleJobEntity> {

    PageResult<ScheduleJobVO> page(ScheduleJobQuery query);

    void save(ScheduleJobVO vo);

    void update(ScheduleJobVO vo);

    void delete(List<Long> idList);

    void run(ScheduleJobVO vo);

    void changeStatus(ScheduleJobVO vo);
}