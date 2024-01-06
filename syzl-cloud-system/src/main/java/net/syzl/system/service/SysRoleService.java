package net.syzl.system.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.system.entity.SysRoleEntity;
import net.syzl.system.query.SysRoleQuery;
import net.syzl.system.vo.SysRoleDataScopeVO;
import net.syzl.system.vo.SysRoleVO;

import java.util.List;

/**
 * 角色
 * 
 * @author admin 
 * 
 */
public interface SysRoleService extends BaseService<SysRoleEntity> {

	PageResult<SysRoleVO> page(SysRoleQuery query);

	List<SysRoleVO> getList(SysRoleQuery query);

	void save(SysRoleVO vo);

	void update(SysRoleVO vo);

	void dataScope(SysRoleDataScopeVO vo);

	void delete(List<Long> idList);
}
