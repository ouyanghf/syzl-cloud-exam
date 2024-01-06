package net.syzl.system.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.system.entity.SysDictDataEntity;
import net.syzl.system.query.SysDictDataQuery;
import net.syzl.system.vo.SysDictDataVO;

import java.util.List;

/**
 * 数据字典
 *
 * @author admin 
 * 
 */
public interface SysDictDataService extends BaseService<SysDictDataEntity> {

    PageResult<SysDictDataVO> page(SysDictDataQuery query);

    void save(SysDictDataVO vo);

    void update(SysDictDataVO vo);

    void delete(List<Long> idList);

}