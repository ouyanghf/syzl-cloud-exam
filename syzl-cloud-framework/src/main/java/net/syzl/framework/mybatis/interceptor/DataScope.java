package net.syzl.framework.mybatis.interceptor;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 数据范围
 *
 * @author admin
 *
 */
@Data
@AllArgsConstructor
public class DataScope {
    private String sqlFilter;

}