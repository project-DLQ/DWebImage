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

//接收地址
@property (nonatomic,copy) NSString *URLStr;

@end
