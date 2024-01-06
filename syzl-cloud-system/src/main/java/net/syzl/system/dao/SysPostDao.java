package net.syzl.system.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.system.entity.SysPostEntity;
import org.apache.ibatis.annotations.Mapper;

/**
* 岗位管理
*
* @author admin
*/
@Mapper
public interface SysPostDao extends BaseDao<SysPostEntity> {
	
}