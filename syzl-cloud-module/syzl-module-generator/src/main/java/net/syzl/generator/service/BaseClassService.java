package net.syzl.generator.service;

import net.syzl.generator.common.page.PageResult;
import net.syzl.generator.common.query.Query;
import net.syzl.generator.common.service.BaseService;
import net.syzl.generator.entity.BaseClassEntity;

import java.util.List;

/**
 * 基类管理
 
 * 
 */
public interface BaseClassService extends BaseService<BaseClassEntity> {

    PageResult<BaseClassEntity> page(Query query);

    List<BaseClassEntity> getList();
}