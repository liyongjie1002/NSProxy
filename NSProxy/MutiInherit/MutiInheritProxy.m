//
//  MutiInheritProxy.m
//  NSProxy
//
//  Created by 国富集团赵 on 2023/11/4.
//

#import "MutiInheritProxy.h"
#import <objc/runtime.h>

@interface MutiInheritProxy ()

@property (nonatomic, strong) NSMutableDictionary   *methodDic;

@end

@implementation MutiInheritProxy

- (void)handleTargets:(NSArray *)targets {
    
    self.methodDic = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < targets.count; i++) {
        id target = targets[i];
        [self registMethodWithTarget:target];
    }
}

- (void)registMethodWithTarget:(id)target {
    unsigned int countOfMethods = 0;
    Method *method_list = class_copyMethodList([target class], &countOfMethods);
    for (int i = 0; i < countOfMethods; i++) {
        Method method = method_list[i];
        // 得到方法的符号
        SEL sel = method_getName(method);
        // 得到方法的符号字符串
        const char *sel_name = sel_getName(sel);
        // 得到方法的名字
        NSString *method_name = [NSString stringWithUTF8String:sel_name];
        self.methodDic[method_name] = target;
    }
    free(method_list);
}

// MARK: - 消息转发
- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    NSString *methodName = NSStringFromSelector(sel);
    id target = self.methodDic[methodName];
    if (target) {
        [invocation invokeWithTarget:target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *Method;
    NSString *methodName = NSStringFromSelector(sel);
    id target = self.methodDic[methodName];
    if (target) {
        Method = [target methodSignatureForSelector:sel];
    } else {
        Method = [super methodSignatureForSelector:sel];
    }
    return Method;
}


@end
