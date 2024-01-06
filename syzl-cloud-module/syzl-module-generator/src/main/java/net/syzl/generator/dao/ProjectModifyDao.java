package net.syzl.generator.dao;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import net.syzl.generator.common.dao.BaseDao;
import net.syzl.generator.entity.ProjectModifyEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目名变更
 
 * 
 */
@Mapper
@InterceptorIgnore(tenantLine = "true")
public interface ProjectModifyDao extends BaseDao<ProjectModifyEntity> {

}