//
//  Children.h
//  Runtime-Demo
//
//  Created by sunxu on 2018/6/27.
//  Copyright © 2018年 sunxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Man.h"
#import "Women.h"

@interface Children : NSProxy<ManProtocol,WomenProtocol>

@property(nonatomic,strong)NSMutableDictionary * methodsMap;;
+(instancetype)shareProxy;
@end
