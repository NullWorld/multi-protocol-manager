//
//  ButtonView.h
//  deleacVC
//
//  Created by 尚宇 on 2019/5/9.
//  Copyright © 2019 cython. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestViewDelegate <NSObject>

- (void)tapView:(UIView *)view;

- (void)printDescrtion;

@end

@interface ButtonView : UIView

@property (nonatomic,weak)id<TestViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
