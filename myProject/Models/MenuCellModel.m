//
//  MenuCellModel.m
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "MenuCellModel.h"

@implementation MenuCellModel
- (id)initWithImg:(NSString *)img Title:(NSString *)title SubTitle:(NSString *)subTitle {
    self = [super init];
    self.img = img;
    self.title = title;
    self.subTitle = subTitle;
    return self;
}
@end
