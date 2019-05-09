//
//  SViewController.m
//  deleacVC
//
//  Created by 尚宇 on 2019/5/8.
//  Copyright © 2019 cython. All rights reserved.
//

#import "SViewController.h"
#import "TestView.h"
#import "CYProtocolManager.h"
#import "ThirdViewController.h"
#import <objc/runtime.h>

@interface SViewController ()<TestViewDelegate,TestViewBtnDelegate>

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 120, 50)];
    [btn addTarget:self action:@selector(persentView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 120, 50)];
    [btn1 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn1];
     method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")), class_getInstanceMethod(self.class, NSSelectorFromString(@"cy_dealloc")));
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(200, 400, 120, 50)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    CYProtocolManager *manager = [CYProtocolManager share];
    [manager addDelegateTarget:self withProtcol:@"TestViewBtnDelegate"];
    view.btnDelegate = manager;
    
    Method deallocMethod = class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc"));
    const char *types = method_getTypeEncoding(deallocMethod);
    
    BOOL xxx = class_addMethod(self.class, NSSelectorFromString(@"dealloc"),(IMP) cy_dealloc, types);
}

- (void)push{
    [self.navigationController pushViewController:[ThirdViewController new] animated:true];
}

- (void)persentView{
    [self.navigationController popViewControllerAnimated:true];
}
- (void)dealloc{
    NSLog(@"==%s=dealloc===",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tapView:(UIView *)view{
    NSLog(@"==%s==%@==",__func__,view);
}

- (void)tapBtn:(UIButton *)btn{
    NSLog(@"==%s==%@==",__func__,btn);
}

//给objc的deallocz转发一个新方法
- (void)cy_dealloc{
    NSLog(@"=====%s====",__func__);
}

static void cy_dealloc(id self ,SEL _cmd){
    NSLog(@"====%s=%@=",__func__,self);
}


@end
