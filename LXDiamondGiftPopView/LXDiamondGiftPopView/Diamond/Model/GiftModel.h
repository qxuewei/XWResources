//
//  GiftModel.h
//  LiveShow
//
//  Created by 刘爱环 on 16/5/4.
//  Copyright © 2016年 MiYou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GiftModel : NSObject


@property (strong, nonatomic) NSString *giftID;
@property (strong, nonatomic) NSString *giftUrl;
@property (strong, nonatomic) NSString *giftName;
@property (strong, nonatomic) NSString *giftPrice;
@property (strong, nonatomic) NSString *giftType;	//0:红包
@property (strong, nonatomic) NSString *giftNums;//这次展示多少个礼物数
@property (strong, nonatomic) NSString *giftIndex;//这次从第几个开始展示



@end
