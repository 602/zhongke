//
//  NetWorkApi.m
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "NetWorkApi.h"

@implementation NetWorkApi

SINGLETON_GCD(NetWorkApi);
#pragma mark - Private method
- (id)firstParse:(id)obj {
    
    switch ([[obj objectForKey:@"respCode"] integerValue]) {
        case kSER_ERROR:
        case kFAIL:
        case kTOKEN_INVALID:
        case kMSG_SEND_FAIL:
        case kOPERATE_MORE:
            [Utils showToastWithText:[obj objectForKey:@"respMsg"]];
            return nil;
            break;
        case kSUCCESS:
        {
            [Utils showToastWithText:[obj objectForKey:@"respMsg"]];
            //返回json解析结果
            return ([MMJsonParse MMstoreListResponceParse:[obj objectForKey:@"data"]]);
        }
            break;
            
        default:
            return nil;
            break;
    }

}

- (void)groupInfoByID:(int)Id success:(ObjectBlock)success failure:(ErrorBlock)failure{
    
    NSDictionary*  paramsDic = @{@"id":[NSString stringWithFormat:@"%d",Id]};
    [[NetWorkRequest sharedNetWorkRequest] AFPostByApiName:@"group/groupInfo" Params:paramsDic success:^(id obj) {
        //json解析
        success(obj);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
- (void)storeList:(NSDictionary *)param success:(ObjectBlock)success failure:(ErrorBlock)failure {
    
    [[NetWorkRequest sharedNetWorkRequest] AFPostByApiName:@"store/storeList" Params:param success:^(id obj) {
        //首次解析，得到respCode，如果成功再返回解析好的数据
        success([self firstParse:obj]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
