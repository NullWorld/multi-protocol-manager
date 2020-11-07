//
//  TestView.h
//  runTimer
//
//  Created by 尚宇 on 2019/5/8.
//  Copyright © 2019 cython. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol TestViewDelegate <NSObject>
//
//- (void)tapView:(UIView *)view;
//
//- (void)printDescrtion;
//
//@end

@protocol TestViewBtnDelegate <NSObject>

- (void)tapBtn:(UIButton*)btn;

@end

@interface TestView : UIView


//@property (nonatomic,weak)id<TestViewDelegate>delegate;

@property (nonatomic,weak)id<TestViewBtnDelegate>btnDelegate;


@end

NS_ASSUME_NONNULL_END
