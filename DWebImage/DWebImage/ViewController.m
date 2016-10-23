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
    //创建自定义操作
    DownLoaderOperation *op = [[DownLoaderOperation alloc] init];
    //把自定义操作添加到队列
    [self.queue addOperation:op];
    
    //向自定义操作中传入图片地址
    op.URLStr = @"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg";
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
