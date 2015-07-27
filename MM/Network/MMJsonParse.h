//
//  MMJsonParse.h
//  myProject
//
//  Created by wangtao on 15/6/2.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMStoreListResponce.h"
#import "MMStore.h"
/**
 *  解析类，其他的自己补充
 */
@interface MMJsonParse : NSObject
/**
 *  店铺列表解析
 */
+ (MMStoreListResponce *)MMstoreListResponceParse:(NSDictionary *) dic;

@end
