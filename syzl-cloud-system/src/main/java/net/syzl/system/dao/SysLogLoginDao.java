package net.syzl.system.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.system.entity.SysLogLoginEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 登录日志
 *
 * @author admin 
 *
 */
@Mapper
public interface SysLogLoginDao extends BaseDao<SysLogLoginEntity> {

}