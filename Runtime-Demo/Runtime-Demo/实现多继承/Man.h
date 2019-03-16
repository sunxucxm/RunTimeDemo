//
//  Man.h
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/27.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ManProtocol <NSObject>
-(void)playGame:(NSString*)str;
@end

@interface Man : NSObject

@end
