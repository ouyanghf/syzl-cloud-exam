package net.syzl.system.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.system.entity.SysRoleDataScopeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色数据权限
 *
 * @author admin
 *
 */
@Mapper
public interface SysRoleDataScopeDao extends BaseDao<SysRoleDataScopeEntity> {

    /**
     * 根据角色ID，获取机构ID列表
     */
    List<Long> getOrgIdList(@Param("roleId") Long roleId);

    /**
     * 获取用户的数据权限列表
     */
    List<Long> getDataScopeList(@Param("userId") Long userId);

}