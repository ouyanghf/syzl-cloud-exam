package net.syzl.message.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.message.entity.SmsLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
* 短信日志
*
* @author admin
*/
@Mapper
public interface SmsLogDao extends BaseDao<SmsLogEntity> {
	
}