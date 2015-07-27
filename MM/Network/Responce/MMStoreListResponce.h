//
//  MMStoreListResponce.h
//  myProject
//
//  Created by wangtao on 15/6/2.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMStoreListResponce : NSObject
@property (unsafe_unretained, nonatomic) int limit;
@property (unsafe_unretained, nonatomic) int prePage;
@property (unsafe_unretained, nonatomic) int start;
@property (unsafe_unretained, nonatomic) int currentPage;
@property (unsafe_unretained, nonatomic) int nextPage;
@property (unsafe_unretained, nonatomic) int count;
@property (unsafe_unretained, nonatomic) StoreStatus status;
@property (strong, nonatomic) NSMutableArray *list;
@end
