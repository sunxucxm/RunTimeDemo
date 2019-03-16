//
//  UIView+Test.m
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/28.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import "UIView+Test.h"
#import <objc/runtime.h>

static char *userNameKey = "userNameKey";
@implementation UIView (Test)

//-(void)setUserName:(NSString *)userName{
//    
//    objc_setAssociatedObject(self, userNameKey, userName, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//-(NSString*)userName{
//    
//    return objc_getAssociatedObject(self, userNameKey);
//}

@end
