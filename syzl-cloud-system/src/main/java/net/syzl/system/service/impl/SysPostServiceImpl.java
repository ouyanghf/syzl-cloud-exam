package net.syzl.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import net.syzl.framework.common.utils.PageResult;
import net.syzl.framework.mybatis.service.impl.BaseServiceImpl;
import net.syzl.system.convert.SysPostConvert;
import net.syzl.system.dao.SysPostDao;
import net.syzl.system.entity.SysPostEntity;
import net.syzl.system.query.SysPostQuery;
import net.syzl.system.service.SysPostService;
import net.syzl.system.service.SysUserPostService;
import net.syzl.system.vo.SysPostVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 岗位管理
 *
 * @author admin 
 *
 */
@Service
@AllArgsConstructor
public class SysPostServiceImpl extends BaseServiceImpl<SysPostDao, SysPostEntity> implements SysPostService {
    private final SysUserPostService sysUserPostService;

    @Override
    public PageResult<SysPostVO> page(SysPostQuery query) {
        IPage<SysPostEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));

        return new PageResult<>(SysPostConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<SysPostVO> getList() {
        SysPostQuery query = new SysPostQuery();
        //正常岗位列表
        query.setStatus(1);
        List<SysPostEntity> entityList = baseMapper.selectList(getWrapper(query));

        return SysPostConvert.INSTANCE.convertList(entityList);
    }

    private Wrapper<SysPostEntity> getWrapper(SysPostQuery query){
        LambdaQueryWrapper<SysPostEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(query.getPostCode()), SysPostEntity::getPostCode, query.getPostCode());
        wrapper.like(StrUtil.isNotBlank(query.getPostName()), SysPostEntity::getPostName, query.getPostName());
        wrapper.eq(query.getStatus() != null, SysPostEntity::getStatus, query.getStatus());
        wrapper.orderByAsc(SysPostEntity::getSort);

        return wrapper;
    }

    @Override
    public void save(SysPostVO vo) {
        SysPostEntity entity = SysPostConvert.INSTANCE.convert(vo);

        baseMapper.insert(entity);
    }

    @Override
    public void update(SysPostVO vo) {
        SysPostEntity entity = SysPostConvert.INSTANCE.convert(vo);

        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        // 删除岗位
        removeByIds(idList);

        // 删除岗位用户关系
        sysUserPostService.deleteByPostIdList(idList);
    }

}