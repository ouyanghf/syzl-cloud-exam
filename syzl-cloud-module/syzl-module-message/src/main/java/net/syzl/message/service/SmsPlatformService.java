package net.syzl.message.service;

import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.BaseService;
import net.syzl.message.entity.SmsPlatformEntity;
import net.syzl.message.query.SmsPlatformQuery;
import net.syzl.message.sms.config.SmsConfig;
import net.syzl.message.vo.SmsPlatformVO;

import java.util.List;

/**
 * 短信平台
 *
 * @author syzl 
 */
public interface SmsPlatformService extends BaseService<SmsPlatformEntity> {

    PageResult<SmsPlatformVO> page(SmsPlatformQuery query);

    /**
     * 启用的短信平台列表
     */
    List<SmsConfig> listByEnable();

    void save(SmsPlatformVO vo);

    void update(SmsPlatformVO vo);

    void delete(List<Long> idList);

}