package net.syzl.generator.service;

import java.util.zip.ZipOutputStream;

/**
 * 代码生成
 
 * 
 */
public interface GeneratorService {

    void downloadCode(Long tableId, ZipOutputStream zip);

    void generatorCode(Long tableId);
}
