//
//  DownLoaderOperation.h
//  DWebImage
//
//  Created by 董立权 on 2016/10/23.
//  Copyright © 2016年 董立权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownLoaderOperation : NSOperation


/**
 类方法,实例化操作,并传入图片地址和下载完成回调

 @param URLStr       图片地址
 @param successBlock 

 @return <#return value description#>
 */
+(instancetype)downloadWithURLStr:(NSString *)URLStr successBlock:(void(^)(UIImage *)) successBlock;

@end
