package net.syzl.generator.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.AllArgsConstructor;
import net.syzl.generator.common.service.impl.BaseServiceImpl;
import net.syzl.generator.dao.TableFieldDao;
import net.syzl.generator.entity.FieldTypeEntity;
import net.syzl.generator.entity.TableFieldEntity;
import net.syzl.generator.enums.AutoFillEnum;
import net.syzl.generator.service.FieldTypeService;
import net.syzl.generator.service.TableFieldService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 表字段
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
@Service
@AllArgsConstructor
public class TableFieldServiceImpl extends BaseServiceImpl<TableFieldDao, TableFieldEntity> implements TableFieldService {
    private final FieldTypeService fieldTypeService;

    @Override
    public List<TableFieldEntity> getByTableId(Long tableId) {
        return baseMapper.getByTableId(tableId);
    }

    @Override
    public void deleteBatchTableIds(Long[] tableIds) {
        baseMapper.deleteBatchTableIds(tableIds);
    }

    @Override
    public void updateTableField(Long tableId, List<TableFieldEntity> tableFieldList) {
        // 更新字段数据
        int sort = 0;
        for (TableFieldEntity tableField : tableFieldList) {
            tableField.setSort(sort++);
            this.updateById(tableField);
        }
    }

    public void initFieldList(List<TableFieldEntity> tableFieldList) {
        // 字段类型、属性类型映射
        Map<String, FieldTypeEntity> fieldTypeMap = fieldTypeService.getMap();
        int index = 0;
        for (TableFieldEntity field : tableFieldList) {
            field.setAttrName(StringUtils.underlineToCamel(field.getFieldName()));
            // 获取字段对应的类型
            FieldTypeEntity fieldTypeMapping = fieldTypeMap.get(field.getFieldType().toLowerCase());
            if (fieldTypeMapping == null) {
                // 没找到对应的类型，则为Object类型
                field.setAttrType("Object");
            } else {
                field.setAttrType(fieldTypeMapping.getAttrType());
                field.setPackageName(fieldTypeMapping.getPackageName());
            }

            field.setAutoFill(AutoFillEnum.DEFAULT.name());
            field.setFormItem(true);
            field.setGridItem(true);
            field.setQueryType("=");
            field.setQueryFormType("text");
            field.setFormType("text");
            field.setSort(index++);
        }
    }

}