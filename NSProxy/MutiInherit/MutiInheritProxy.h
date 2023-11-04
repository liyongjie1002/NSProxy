//
//  MutiInheritProxy.h
//  NSProxy
//
//  Created by 国富集团赵 on 2023/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MutiInheritProxy : NSProxy

- (void)handleTargets:(NSArray *)targets;

@end

NS_ASSUME_NONNULL_END

/*
 模拟多继承：大致过程就是让它持有要实现多继承的类的对象，然后用多个接口定义不同的行为，并让 Proxy 去实现这些接口，然后在转发的时候把消息转发到实现了该接口的对象去执行，这样就好像实现了多重继承一样。注意：这个真不是多重继承，只是包含，然后把消息路由到指定的对象而已，其实完全可以用 NSObject 类来实现；
NSObject 寻找方法顺序：本类 -> 父类 -> 动态方法解析 -> 备用对象 -> 消息转发；
NSproxy 寻找方法顺序：本类 -> 消息转发；
*/
