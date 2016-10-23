//
//  DownLoaderOperation.m
//  DWebImage
//
//  Created by 董立权 on 2016/10/23.
//  Copyright © 2016年 董立权. All rights reserved.
//

#import "DownLoaderOperation.h"

@interface DownLoaderOperation()


//接收地址
@property (nonatomic,copy) NSString *URLStr;
//接收代码块
@property (nonatomic,copy) void(^successBlock)(UIImage *image);


@end

@implementation DownLoaderOperation

//start
/*
 start方法会更新操作的状态
 确保操作能够正常执行
 一旦start检测到操作被取消或者已经执行结束,就不会让其再去调用main方法
 start先调用,再调用main
 
 */

//main
/*
 main方法默认在子线程异步执行
 系统执行这个方法时什么都没做,只提供异步环境
 可以重写main方法,去做你希望做的事情(专门为自定义NSOpertion准备的描述)
 不需要调用super,不需要创建自动释放池
 
 */

/*
 图片下载
 需要在子线程异步下载
 图片下载需要地址
 把图片对象传递到展示的地方(Block 代理 通知)
 
 */
//重写操作执行的一个入口方法:做你想做的事情,默认在子线程异步执行的
//一旦队列调度了操作执行,那么这个操作就会自动的执行main方法


//自定义操作实例化的方法
//此方法先于main方法执行
+(instancetype)downloadWithURLStr:(NSString *)URLStr successBlock:(void (^)(UIImage *))successBlock{
    //实例化自定义操作
    DownLoaderOperation *op = [[DownLoaderOperation alloc] init];
    //保存图片地址和下载完成回调,就可以在当前类全局使用
    op.URLStr = URLStr;
    op.successBlock = successBlock;
    //返回自定义操作
    
    return op;
}
-(void)main{
    
    //检测图片地址
    NSLog(@"传入 %@",self.URLStr);
    //图片下载
    NSURL *url = [NSURL URLWithString:self.URLStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"----%@",image);
    //图片下载完成之后需要回调
    if(self.successBlock != nil){
        //执行完这行代码VC里面的代码块就会执行
        //注意:在哪个线程回调代码块,那么代码块就在哪个线程执行,代理/通知也是这样的
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.successBlock(image);

        }];
    }
}
@end
