//
//  ViewController.m
//  deleacVC
//
//  Created by 尚宇 on 2019/5/8.
//  Copyright © 2019 cython. All rights reserved.
//

#import "ViewController.h"
#import "SViewController.h"
#import "CYProtocolManager.h"
#import "TestView.h"
#import "ButtonView.h"


@interface ViewController ()<TestViewDelegate,TestViewBtnDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 120, 50)];
    [btn addTarget:self action:@selector(persentView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(200, 400, 120, 50)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    CYProtocolManager *manager = [CYProtocolManager share];
    [manager addDelegateTarget:self withProtcol:@"TestViewDelegate"];
    view.delegate = (id<TestViewDelegate>)manager;
    
    ButtonView *btnView = [[ButtonView alloc] initWithFrame:CGRectMake(200, 600, 120, 50)];
    btnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btnView];
    btnView.delegate = (id<TestViewDelegate>)manager;
}

- (void)persentView{
    [self.navigationController pushViewController:[SViewController new] animated:true];
}
- (void)dealloc{
    NSLog(@"==%s=dealloc===",__func__);
}

- (void)tapView:(UIView *)view{
    NSLog(@"==%s==%@==",__func__,view);
}

- (void)tapBtn:(UIButton *)btn{
    NSLog(@"==%s==%@==",__func__,btn);
}

- (void)printDescrtion{
    NSLog(@"asdasdasdasda");
}



@end
