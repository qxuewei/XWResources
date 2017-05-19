//
//  LXDiamondGiftPopView.h
//  Beijing
//
//  Created by 邱学伟 on 2017/5/18.
//  Copyright © 2017年 MiYou. All rights reserved.
//	弹出钻石礼物视图

#import <UIKit/UIKit.h>
@class LXDiamondGiftPopModel;

typedef void(^isFinishedShowDiamondAnimationBlock)(BOOL isFinishedShowDiamondAnimation);

@interface LXDiamondGiftPopView : UIView

/// 展示礼物钻石动画
+ (void)showDiamondGiftPopViewWithModle:(LXDiamondGiftPopModel *)model isFinishedShowDiamondAnimation:(isFinishedShowDiamondAnimationBlock)isFinishedShowDiamondAnimationBlock inSuperView:(UIView *)superView;

@end
