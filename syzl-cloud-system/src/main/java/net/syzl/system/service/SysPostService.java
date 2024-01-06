package net.syzl.system.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.system.entity.SysPostEntity;
import net.syzl.system.query.SysPostQuery;
import net.syzl.system.vo.SysPostVO;

import java.util.List;

/**
 * 岗位管理
 *
 * @author admin
 * 
 */
public interface SysPostService extends BaseService<SysPostEntity> {

    PageResult<SysPostVO> page(SysPostQuery query);

    List<SysPostVO> getList();

    void save(SysPostVO vo);

    void update(SysPostVO vo);

    void delete(List<Long> idList);
}