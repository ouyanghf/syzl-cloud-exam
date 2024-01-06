package net.syzl.storage.properties;

import lombok.Data;

/**
 * 阿里云存储配置项
 *
 * @author admin 
 * 
 */
@Data
public class AliyunStorageProperties {
    private String endPoint;
    private String accessKeyId;
    private String accessKeySecret;
    private String bucketName;
}
