//
//  MessageForward.m
//  Runtime-Demo
//
//  Created by sunxu on 20  8/6/27.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import "MessageForward.h"
#import <objc/runtime.h>
#import "Reserve.h"

@implementation MessageForward

//动态方法解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSString * methodName = NSStringFromSelector(sel);
    if ([methodName isEqualToString:@"sendMessage:type:"]) {
        
       
//         return class_addMethod(self.class, sel, (IMP)sendMessage,"v@:@@");
    }
    return NO;
}

void sendMessage(id self,SEL _cmd, NSString * message,NSString * type){
    NSLog(@"%@----%@",message,type);
}

// 找备用
-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    NSString * methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:type:"]) {
        
//        return [[Reserve alloc]init];
    }
  
    return [super forwardingTargetForSelector:aSelector];
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    
    
     NSString * methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:type:"]) {
        
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel  = [anInvocation selector];
    Reserve * r = [[Reserve alloc]init];
    if ([r respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:r];
    }else{
        [super forwardInvocation:anInvocation];
    }
    
}


-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"消息无法处理");
}


















@end
