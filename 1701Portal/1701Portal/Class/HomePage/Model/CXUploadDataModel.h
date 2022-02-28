//
//  CXUploadDataModel.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UploadType) {
    UploadTypeImage,        /**< 上传图片 */
    UploadTypeZip           /**< 上传zip文件 */
};


@interface CXUploadDataModel : NSObject
/*
 文件名称
 */
@property (nonatomic, copy) NSString *fileName;

/*
 文件路径
 */
@property (nonatomic, copy) NSString *filePath;

/*
 图片
 */
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSData *imageCompressData; // 图片压缩后的数据 优先级比image高
/*
 上传时服务器需要的key
 */
@property (nonatomic, copy) NSString *keyName;

/*
 需要上传的文件
 */
@property (nonatomic, strong) NSData *data;

@property (nonatomic, assign) UploadType uploadType;
@end

NS_ASSUME_NONNULL_END
