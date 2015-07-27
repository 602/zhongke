//
//  MMJsonParse.m
//  myProject
//
//  Created by wangtao on 15/6/2.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "MMJsonParse.h"
@implementation MMJsonParse
+(MMStoreListResponce *)MMstoreListResponceParse:(NSDictionary *)dic {
    
    MMStoreListResponce *responce = [[MMStoreListResponce alloc]init];
    responce.limit = (int)[dic objectForKey:@"limit"];
    responce.prePage = (int)[dic objectForKey:@"prePage"];
    responce.start = (int)[dic objectForKey:@"start"];
    responce.currentPage = (int)[dic objectForKey:@"currentPage"];
    responce.nextPage = (int)[dic objectForKey:@"nexyPage"];
    responce.count = (int)[dic objectForKey:@"count"];
    responce.status = (int)[dic objectForKey:@"status"];
    responce.list = [NSMutableArray array];
    
    NSArray *listArr = [dic objectForKey:@"list"];
    for (int i =0; i<listArr.count; i++) {
        NSDictionary *storeDic = listArr[i];
        MMStore *store = [[MMStore alloc]init];
        store.ID = (int)[storeDic objectForKey:@"id"];
        store.storeType = (int)[storeDic objectForKey:@"storeType"];
        store.storeName = [storeDic objectForKey:@"storeName"];
        store.price = [storeDic objectForKey:@"price"];
        store.discount = [storeDic objectForKey:@"discount"];
        store.tel = [storeDic objectForKey:@"tel"];
        store.tag = [storeDic objectForKey:@"tag"];
        store.address = [storeDic objectForKey:@"address"];
        store.cityName = [storeDic objectForKey:@"cityName"];
        store.areaName = [storeDic objectForKey:@"areaName"];
        store.street = [storeDic objectForKey:@"street"];
        store.storeDesc = [storeDic objectForKey:@"storeDesc"];
        store.viewCount = [storeDic objectForKey:@"ViewCount"];
        store.lng = [storeDic objectForKey:@"lng"];
        store.lat = [storeDic objectForKey:@"lat"];
        store.distance = [storeDic objectForKey:@"distance"];
        store.imgUrl = [storeDic objectForKey:@"imgUrl"];
        
        [responce.list addObject:store];
    }
    return responce;
}
@end
