//
//  MMStore.h
//  myProject
//
//  Created by wangtao on 15/6/2.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMStore : NSObject
@property (unsafe_unretained, nonatomic) int ID;
@property (unsafe_unretained, nonatomic) int storeType;
@property (strong, nonatomic) NSString *storeName;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *discount;
@property (strong, nonatomic) NSString *tel;
@property (strong, nonatomic) NSString *tag;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *areaName;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *storeDesc;
@property (strong, nonatomic) NSString *viewCount;
@property (strong, nonatomic) NSString *lng;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *distance;
@property (strong, nonatomic) NSString *imgUrl;

@end
