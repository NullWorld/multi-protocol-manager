//
//  ThirdViewController.m
//  deleacVC
//
//  Created by 尚宇 on 2019/5/8.
//  Copyright © 2019 cython. All rights reserved.
//

#import "ThirdViewController.h"
#import "SViewController.h"
#import "CYProtocolManager.h"
#import "TestView.h"

@interface ThirdViewController ()<TestViewDelegate,TestViewBtnDelegate>

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [manager addDelegateTarget:self withProtcol:@"TestViewBtnDelegate"];
    view.delegate = (id<TestViewDelegate>)manager;
    view.btnDelegate = (id<TestViewBtnDelegate>) manager;
    
    [manager removeAll];
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

- (void)dealloc{
    NSLog(@"===%s==",__func__);
}

- (void)persentView{
    [self.navigationController popToRootViewControllerAnimated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
