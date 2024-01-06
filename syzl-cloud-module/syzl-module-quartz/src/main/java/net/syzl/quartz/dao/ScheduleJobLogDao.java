package net.syzl.quartz.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.quartz.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
* 定时任务日志
*
* @author admin
*/
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}