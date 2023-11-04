//
//  ViewController.m
//  NSProxy
//
//  Created by 国富集团赵 on 2023/11/4.
//

#import "ViewController.h"
//
#import "InfoA.h"
#import "InfoB.h"
#import "MutiInheritProxy.h"
//
#import "WeakProxy.h"
//
#import "Dog.h"
#import "AOPProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// MARK: - 多继承
- (IBAction)didClickMutiInherit {

    InfoA *a = [[InfoA alloc] init];
    InfoB *b = [[InfoB alloc] init];
    MutiInheritProxy *proxy = [MutiInheritProxy alloc];
    [proxy handleTargets:@[a, b]];
    [proxy performSelector:@selector(excuteA)];
    [proxy performSelector:@selector(excuteB)];
}

// MARK: - 解决循环引用
- (IBAction)didClickCycle {
    self.timer = [NSTimer timerWithTimeInterval:1
                                         target:[WeakProxy proxyWithTarget:self]
                                       selector:@selector(timerInvoked)
                                       userInfo:nil
                                        repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}

- (void)timerInvoked {
    NSLog(@"定时器定时器定时器定时器定时器");
}

// MARK: - 实现AOP
- (IBAction)didClickAOP {
    
}




@end
