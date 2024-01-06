package net.syzl.system.convert;

import net.syzl.system.entity.SysParamsEntity;
import net.syzl.system.vo.SysParamsVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 参数管理
 *
 * @author admin
 *
 */
@Mapper
public interface SysParamsConvert {
    SysParamsConvert INSTANCE = Mappers.getMapper(SysParamsConvert.class);

    SysParamsEntity convert(SysParamsVO vo);

    SysParamsVO convert(SysParamsEntity entity);

    List<SysParamsVO> convertList(List<SysParamsEntity> list);

}