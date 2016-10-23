//
//  ViewController.m
//  DWebImage
//
//  Created by 董立权 on 2016/10/23.
//  Copyright © 2016年 董立权. All rights reserved.
//

#import "ViewController.h"
#import "DownLoaderOperation.h"
@interface ViewController ()

@property (nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建队列
    self.queue = [[NSOperationQueue alloc] init];
    //图片地址
    NSString *URLStr = @"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg";
    void(^successBlock)() = ^(UIImage *image){
        NSLog(@"VC :%@",[NSThread currentThread]);
        
    };
    //创建自定义操作
    DownLoaderOperation *op = [DownLoaderOperation downloadWithURLStr:URLStr successBlock:successBlock];
   //向自定义操作中传入图片地址
                               
   //把自定义操作添加到队列
   [self.queue addOperation:op];

    
    
}
/*
//对象方法,自定义NSOperation
-(void)test{
    
    //创建队列
    self.queue = [[NSOperationQueue alloc] init];
    //图片地址
    NSString *URLStr = @"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg";
    void(^successBlock)() = ^(UIImage *image){
        NSLog(@"VC :%@",[NSThread currentThread]);

    }
    //创建自定义操作
    DownLoaderOperation *op = [[DownLoaderOperation downloadWithURLStr:URLStr successBlock:successBlock];
    //向自定义操作中传入图片地址
    op.URLStr = @"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg";
    //定义和传递代码块
    void(^successBlock)() = ^(UIImage *image){
        //先检测是否可以成功的拿到图片图像
        NSLog(@"VC: %@",image);
        NSLog(@"VC :%@",[NSThread currentThread]);
    };
    op.successBlock = successBlock;
    
    
    //把自定义操作添加到队列
    [self.queue addOperation:op];

}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
