//
//  NetWorkApi.h
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  网络请求的唯一入口，其他功能封装起来
 */
@interface NetWorkApi : NSObject
+ (NetWorkApi *)sharedNetWorkApi;
//============================所有接口入口==========================
/**
 *  圈子详细信息
 */
- (void)groupInfoByID:(int)Id success:(ObjectBlock)success failure:(ErrorBlock)failure;
- (void)storeList:(NSDictionary *)param success:(ObjectBlock)success failure:(ErrorBlock)failure;
@end
