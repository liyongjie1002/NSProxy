//
//  WeakProxy.h
//  NSProxy
//
//  Created by 国富集团赵 on 2023/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

/*
 timer <=> vc 互相强持有
 使用NSProxy解决循环引用
 timer -> proxy -> target
 */
