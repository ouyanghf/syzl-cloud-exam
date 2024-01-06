package net.syzl.generator.autoconfigure;

import lombok.AllArgsConstructor;
import net.syzl.generator.config.template.GeneratorConfig;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * spring boot starter AutoConfiguration
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
@Configuration
@AllArgsConstructor
@ComponentScan(basePackages = {"net.syzl.generator"})
@EnableConfigurationProperties(GeneratorProperties.class)
public class GeneratorAutoConfiguration {
    private final GeneratorProperties properties;

    @Bean
    GeneratorConfig generatorConfig() {
        return new GeneratorConfig(properties.getTemplate());
    }

}
