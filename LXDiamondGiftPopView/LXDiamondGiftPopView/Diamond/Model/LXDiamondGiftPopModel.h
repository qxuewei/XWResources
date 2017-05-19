//
//  LXDiamondGiftPopModel.h
//  LXDiamondGiftPopView
//
//  Created by 邱学伟 on 2017/5/18.
//  Copyright © 2017年 邱学伟. All rights reserved.
//	弹出钻石礼物模型

#import <Foundation/Foundation.h>
@class GiftModel;

@interface LXDiamondGiftPopModel : NSObject

@property (nonatomic, strong) GiftModel *giftModel;
/// 下次钻石礼物时间间隔
@property (nonatomic, copy) NSString *nextShowDiamondGiftPopTimeDistance;
/// 今天剩余抽奖次数
@property (nonatomic, copy) NSString *surplusCountForDiamondGiftPop;

@end
