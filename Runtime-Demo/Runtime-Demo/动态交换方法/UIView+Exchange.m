//
//  UIView+Exchange.m
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/28.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import "UIView+Exchange.h"
#import <objc/runtime.h>

@implementation UIView (Exchange)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method  method1 = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
        Method  method2 = class_getInstanceMethod([self class], @selector(customSetBackgroundColor:));
        //        if (add) {
        //
        //            class_replaceMethod([self class], @selector(setBackgroundColor:), method_getImplementation(method2), method_getTypeEncoding(method2));
        //        }else{
        //            method_exchangeImplementations(method1, method2);
        //        }
        method_exchangeImplementations(method1, method2);
    });
}

-(void)customSetBackgroundColor:(UIColor*)color{
    
    if (color == [UIColor greenColor]) {
       [self customSetBackgroundColor:[UIColor redColor]];
    }else{
        [self customSetBackgroundColor:[UIColor whiteColor]];
    }
    
}

@end
