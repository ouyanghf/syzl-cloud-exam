package net.syzl.generator.service;

import net.syzl.generator.common.page.PageResult;
import net.syzl.generator.common.query.Query;
import net.syzl.generator.common.service.BaseService;
import net.syzl.generator.entity.ProjectModifyEntity;

import java.io.IOException;

/**
 * 项目名变更
 
 * 
 */
public interface ProjectModifyService extends BaseService<ProjectModifyEntity> {

    PageResult<ProjectModifyEntity> page(Query query);

    byte[] download(ProjectModifyEntity project) throws IOException;

}