package net.syzl.system.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.system.entity.SysLogOperateEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 操作日志
 *
 * @author admin
 *
 */
@Mapper
public interface SysLogOperateDao extends BaseDao<SysLogOperateEntity> {

}