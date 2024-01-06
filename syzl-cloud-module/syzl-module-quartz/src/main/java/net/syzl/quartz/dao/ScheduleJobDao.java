package net.syzl.quartz.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.quartz.entity.ScheduleJobEntity;
import org.apache.ibatis.annotations.Mapper;

/**
* 定时任务
*
* @author admin 
*/
@Mapper
public interface ScheduleJobDao extends BaseDao<ScheduleJobEntity> {
	
}