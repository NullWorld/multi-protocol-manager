//
//  CYProtocolManager.h
//  deleacVC
//
//  Created by 尚宇 on 2019/5/8.
//  Copyright © 2019 cython. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYProtocolManager : NSObject

//单例
+ (instancetype)share;

//添加代理对象和协议名称(一般为协议名称)
- (void)addDelegateTarget:(id)target withProtcol:(id)protocol;

//移除确定不使用的协议
- (void)removeDelegateProtocol:(id)protocol;

//移除所有的类
- (void)removeAll;

@end

NS_ASSUME_NONNULL_END
