package net.syzl.generator.config.template;

import lombok.Data;

/**
 * 模板信息
 
 * 
 */
@Data
public class TemplateInfo {
    /**
     * 模板名称
     */
    private String templateName;
    /**
     * 模板内容
     */
    private String templateContent;
    /**
     * 生成代码的路径
     */
    private String generatorPath;
}
