//
//  AOPProxy.h
//  NSProxy
//
//  Created by 国富集团赵 on 2023/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^proxyBlock)(id target,SEL selector);

@interface AOPProxy : NSProxy

@end


NS_ASSUME_NONNULL_END


/*
AOP两种实现
 1、 runtime，方法替换
 2、基于NSProxy
 
 */
