package net.syzl.system.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.system.entity.SysAttachmentEntity;
import net.syzl.system.query.SysAttachmentQuery;
import net.syzl.system.vo.SysAttachmentVO;

import java.util.List;

/**
 * 附件管理
 *
 * @author admin 
 *
 */
public interface SysAttachmentService extends BaseService<SysAttachmentEntity> {

    PageResult<SysAttachmentVO> page(SysAttachmentQuery query);

    void save(SysAttachmentVO vo);

    void update(SysAttachmentVO vo);

    void delete(List<Long> idList);
}