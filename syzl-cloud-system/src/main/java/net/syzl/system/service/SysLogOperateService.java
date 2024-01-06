package net.syzl.system.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.system.entity.SysLogOperateEntity;
import net.syzl.system.query.SysLogOperateQuery;
import net.syzl.system.vo.SysLogOperateVO;

/**
 * 操作日志
 *
 * @author admin
 *
 */
public interface SysLogOperateService extends BaseService<SysLogOperateEntity> {

    PageResult<SysLogOperateVO> page(SysLogOperateQuery query);
}