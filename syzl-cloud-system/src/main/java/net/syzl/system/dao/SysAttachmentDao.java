package net.syzl.system.dao;

import net.syzl.framework.mybatis.dao.BaseDao;
import net.syzl.system.entity.SysAttachmentEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 附件管理
 *
 * @author admin
 * 
 */
@Mapper
public interface SysAttachmentDao extends BaseDao<SysAttachmentEntity> {

}