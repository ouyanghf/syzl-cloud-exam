package net.syzl.generator.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import net.syzl.generator.common.page.PageResult;
import net.syzl.generator.common.query.Query;
import net.syzl.generator.common.service.impl.BaseServiceImpl;
import net.syzl.generator.dao.BaseClassDao;
import net.syzl.generator.entity.BaseClassEntity;
import net.syzl.generator.service.BaseClassService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 基类管理
 
 * 
 */
@Service
public class BaseClassServiceImpl extends BaseServiceImpl<BaseClassDao, BaseClassEntity> implements BaseClassService {

    @Override
    public PageResult<BaseClassEntity> page(Query query) {
        IPage<BaseClassEntity> page = baseMapper.selectPage(
                getPage(query), getWrapper(query)
        );

        return new PageResult<>(page.getRecords(), page.getTotal());
    }

    @Override
    public List<BaseClassEntity> getList() {
        return baseMapper.selectList(null);
    }

    @Override
    public boolean save(BaseClassEntity entity) {
        entity.setCreateTime(new Date());
        return super.save(entity);
    }
}