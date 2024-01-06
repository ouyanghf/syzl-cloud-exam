package net.syzl.system.convert;

import net.syzl.system.entity.SysUserTokenEntity;
import net.syzl.system.vo.SysUserTokenVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 用户Token
 *
 * @author admin 
 */
@Mapper
public interface SysUserTokenConvert {
    SysUserTokenConvert INSTANCE = Mappers.getMapper(SysUserTokenConvert.class);

    SysUserTokenEntity convert(SysUserTokenVO vo);

    SysUserTokenVO convert(SysUserTokenEntity entity);

}