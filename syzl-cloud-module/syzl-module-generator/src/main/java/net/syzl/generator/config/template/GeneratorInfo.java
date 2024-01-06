package net.syzl.generator.config.template;

import lombok.Data;

import java.util.List;

/**
 * 代码生成信息
 
 * 
 */
@Data
public class GeneratorInfo {
    private ProjectInfo project;
    private DeveloperInfo developer;
    private List<TemplateInfo> templates;
}
