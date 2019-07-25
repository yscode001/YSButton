//
//  ViewController.m
//  YSButton
//
//  Created by yaoshuai on 2019/7/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ViewController.h"
#import "YSButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YSButton *btn = [[YSButton alloc] initWithFrame:CGRectMake(100, 200, 20, 20)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    btn.titleRect = CGRectMake(10 , 60, 100, 40);
    btn.imageRect = CGRectMake(40, 10, 40, 40);
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:btn];
}

- (void)btnClick{
    NSLog(@"按钮被点击了");
}

@end
