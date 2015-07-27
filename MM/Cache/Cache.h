//
//  Cache.h
//  QQing
//
//  Created by 王涛 on 1/29/15.
//
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

+ (Cache *)sharedCache;

// 属性标记
@property BOOL isSignin;

// 保存用户名\密码\登陆状态
- (void)setUsername:(NSString *)username password:(NSString *)password;
- (void)setUsername:(NSString *)username;

- (NSString *)username;
- (NSString *)password;

- (void)setUserID:(long long)userID;
- (long long)userID;

- (void)setCookie:(BOOL)_isSignin;
- (BOOL)cookie;

- (void)setSession:(long)session;
- (long)session;

- (void)resetUser;

@end

