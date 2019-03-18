//
//  ViewController.m
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/27.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import "ViewController.h"
#import "MessageForward.h"
#import "Children.h"
#import "UIView+Exchange.h"
#import "UIView+Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sendMessage];
    master 1
}

//换个方式调用方法
-(void)sendMessage{
        NSMethodSignature *sigOfPrintStr = [self methodSignatureForSelector:@selector(printStr1: type:)];
        //获取方法签名对应的invocation
        NSInvocation *invocationOfPrintStr = [NSInvocation invocationWithMethodSignature:sigOfPrintStr];
        /** 设置消息接受者，与[invocationOfPrintStr setArgument:(__bridge void * _Nonnull)(self) atIndex:0]等价 */
    
//        [invocationOfPrintStr setTarget:self];
    
        /**设置要执行的selector。与[invocationOfPrintStr setArgument:@selector(printStr1:) atIndex:1] 等价*/
        [invocationOfPrintStr setSelector:@selector(printStr1: type:)];
        //设置参数
        NSString *str1 = @"hello world 1";
        NSString *str2 = @"hello world 2";
        [invocationOfPrintStr setArgument:&str1 atIndex:2];
    
        [invocationOfPrintStr setArgument:&str2 atIndex:3];
        //开始执行
//        [invocationOfPrintStr invoke];
    
        [invocationOfPrintStr invokeWithTarget:self];
    
}

-(void)printStr1:(NSString*)str type:(NSString*)type{

}


//分类添加属性
- (IBAction)addAttributeToCategory:(id)sender {

     self.view.userName = @"我最帅";
    NSLog(@"%@",self.view.userName);
}


//消息转发
- (IBAction)messageFarwarding:(id)sender {
    
    MessageForward * message = [[MessageForward alloc]init];
    [message sendMessage:@"hello world" type:@"sunxu"];
}

//交换方法
- (IBAction)exchangeMethod:(id)sender {
    
    self.view.backgroundColor = [UIColor greenColor];
    
}

//多继承
- (IBAction)moreInheritance:(id)sender {
    
    Children * child = [Children shareProxy];
    [child playGame:@"hh"];
    [child buy:@"ww"];
}



@end
