//
//  Children.m
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/27.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import "Children.h"
#import <objc/runtime.h>
#import "Man.h"
#import "Women.h"

@implementation Children

+(instancetype)shareProxy{
    return [[self alloc]init];
}

-(instancetype)init{
 
    _methodsMap = [NSMutableDictionary dictionary];
    [self registerMethodsWithTarget:[Man new]];
    [self registerMethodsWithTarget:[Women new]];
    return self;
}

-(void)registerMethodsWithTarget:(id)target{
    
    unsigned int count = 0;
    Method * method_list = class_copyMethodList([target class], &count);
    for (int i=0; i<count; i++) {
        Method method = method_list[i];
        SEL sel = method_getName(method);
        [_methodsMap setObject:target forKey:NSStringFromSelector(sel)];
    }
    free(method_list);
    
}

-(nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    NSString * methodName = NSStringFromSelector(sel);
    id target = _methodsMap[methodName];
  
    if (target && [target respondsToSelector:sel]) {
        return  [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
        return   [super methodSignatureForSelector:sel];
    }
}

-(void)forwardInvocation:(NSInvocation *)invocation{
//    NSString *  jjj;
//    [invocation getArgument:&jjj atIndex:1];
//    NSLog(@"%@",jjj);
    SEL sel = [invocation selector];
    NSString * methodName = NSStringFromSelector(sel);
    id target = _methodsMap[methodName];
    if (target && [target respondsToSelector:sel]){
        [invocation invokeWithTarget:target];
    }else{
        [super forwardInvocation:invocation];
    }
}

@end
