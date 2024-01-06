package net.syzl.message.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.message.entity.SmsPlatformEntity;
import org.apache.ibatis.annotations.Mapper;

/**
* 短信平台
*
* @author admin
*/
@Mapper
public interface SmsPlatformDao extends BaseDao<SmsPlatformEntity> {
	
}