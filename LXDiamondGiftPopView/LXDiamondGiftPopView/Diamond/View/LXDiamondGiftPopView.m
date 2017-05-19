//
//  LXDiamondGiftPopView.m
//  Beijing
//
//  Created by 邱学伟 on 2017/5/18.
//  Copyright © 2017年 MiYou. All rights reserved.
//

#import "LXDiamondGiftPopView.h"
#import "LXDiamondGiftPopModel.h"
#import "GiftModel.h"

@interface LXDiamondGiftPopView ()

@property (weak, nonatomic) IBOutlet UIImageView *diamondGiftImageView;
@property (weak, nonatomic) IBOutlet UILabel *diamondGiftNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *diamondGiftPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextShowDiamondGiftPopTimeDistanceLabel; ///下次捡礼物钻石时间间隔
@property (weak, nonatomic) IBOutlet UILabel *surplusCountForDiamondGiftPopLabel; ///剩余捡礼物钻石机会次数
@property (nonatomic, copy) isFinishedShowDiamondAnimationBlock isFinishedShowDiamondAnimationB;

@end

@implementation LXDiamondGiftPopView
#pragma mark - public
/// 从xib加载视图
+ (instancetype)loadFromNib {
	return (LXDiamondGiftPopView *)[[[NSBundle mainBundle] loadNibNamed:@"LXDiamondGiftPopView" owner:nil options:nil] objectAtIndex:0];
}

/// 展示礼物钻石动画
+ (void)showDiamondGiftPopViewWithModle:(LXDiamondGiftPopModel *)model isFinishedShowDiamondAnimation:(isFinishedShowDiamondAnimationBlock)isFinishedShowDiamondAnimationBlock inSuperView:(UIView *)superView{
	CGPoint screenCenterPoint = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
	LXDiamondGiftPopView *diamondGiftPopView = [LXDiamondGiftPopView loadFromNib];
	diamondGiftPopView.isFinishedShowDiamondAnimationB = isFinishedShowDiamondAnimationBlock;
	[diamondGiftPopView updateDiamondGiftDataWithModel:model];
        diamondGiftPopView.frame = CGRectMake(0, 0, 206, 278);
	diamondGiftPopView.center = screenCenterPoint;
	[superView addSubview:diamondGiftPopView];
	[diamondGiftPopView showAnimation];
}

#pragma mark - click
- (IBAction)cancelClick:(id)sender {
	NSLog(@"取消");
	[self dismissAnimation];
}
- (IBAction)sendGiftClick:(UIButton *)sender {
	
}

#pragma mark - private
/// 弹出动画
- (void)showAnimation {
	CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animation];
	bounceAnimation.keyPath = @"transform.scale";
	bounceAnimation.duration = 0.5f;
	bounceAnimation.calculationMode = kCAAnimationCubic;
	bounceAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:.0f],[NSNumber numberWithFloat:0.5f],[NSNumber numberWithFloat:0.9f],[NSNumber numberWithFloat:1.15f],[NSNumber numberWithFloat:0.95f],[NSNumber numberWithFloat:1.02f], [NSNumber numberWithFloat:1.0f], nil];
	[self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

/// 消失动画
- (void)dismissAnimation {
	CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animation];
	bounceAnimation.keyPath = @"transform.scale";
	bounceAnimation.duration = 0.3f;
	bounceAnimation.calculationMode = kCAAnimationCubic;
	bounceAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0f], [NSNumber numberWithFloat:0.8f],[NSNumber numberWithFloat:0.6f],[NSNumber numberWithFloat:0.4f], [NSNumber numberWithFloat:0.2f],[NSNumber numberWithFloat:0.f], nil];
	[self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self removeView];
	});
}

/// 移除视图
- (void)removeView {
	if (self.isFinishedShowDiamondAnimationB) {
		self.isFinishedShowDiamondAnimationB(YES);
	}
	[self removeFromSuperview];
}


/// 布局视图数据
- (void)updateDiamondGiftDataWithModel:(LXDiamondGiftPopModel *)model {
	self.diamondGiftImageView.image = [LXDiamondGiftPopView diamondGiftImageWithGiftID:model.giftModel.giftID.integerValue];
	self.diamondGiftNameLabel.text = [NSString stringWithFormat:@"您得了个: %@ 赶紧去瞅瞅",model.giftModel.giftName];
	
	self.diamondGiftPriceLabel.text = [NSString stringWithFormat:@"价值为%zd钻石已存入您的账户",model.giftModel.giftPrice.integerValue];
	self.nextShowDiamondGiftPopTimeDistanceLabel.text = model.nextShowDiamondGiftPopTimeDistance;// [NSString stringWithFormat:@"%zd分钟后的礼物倍儿棒, 千万别急着颠儿",model.nextShowDiamondGiftPopTimeDistance.integerValue];
	self.surplusCountForDiamondGiftPopLabel.text = model.surplusCountForDiamondGiftPop;// [NSString stringWithFormat:@"剩余%zd次捡钻石机会",model.nextShowDiamondGiftPopTimeDistance.integerValue];
}

+ (UIImage *)diamondGiftImageWithGiftID:(NSUInteger)giftID {
	NSString *imageName = [self diamondGiftImageNameWithGiftID:giftID];
	NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
	return [UIImage imageWithContentsOfFile:imageFilePath];
}

+ (NSString *)diamondGiftImageNameWithGiftID:(NSUInteger)giftID {
	NSString *imageName = [[NSString alloc] init];
	switch (giftID) {
		case 1://冰糖葫芦
			return @"diamond_gift_bingtanghulu.png";
			break;
		case 2://汽水
			return @"diamond_gift_beibingyang.png";
			break;
		case 3://果脯
			return @"diamond_gift_guofu.png";
			break;
		case 4://二锅头
			return @"diamond_gift_erguotou.png";
			break;
		case 5://炸酱面
			return @"diamond_gift_zhajiangmian.png";
			break;
		case 6://铜火锅
			return @"diamond_gift_tonghuoguo.png";
			break;
		case 7://北京烤鸭
			return @"diamond_gift_beijingkaoya.png";
			break;
		case 8://满山红
			return @"diamond_gift_yuejihua.png";
			break;
		case 9://月季花
			return @"diamond_gift_yuejihua.png";
			break;
		case 26://皇家园林
			return @"diamond_gift_huangjiayuanlin.png";
			break;

		case 10://2333
			return @"diamond_gift_23333.png";
			break;
		case 11://666
			return @"diamond_gift_666.png";
			break;
		case 12://v587
			return @"diamond_gift_v587.png";
			break;
		case 13://GG
			return @"diamond_gift_GG.png";
			break;
		case 14://城会玩
			return @"diamond_gift_chenghuiwan.png";
			break;
		case 15://查水表
			return @"diamond_gift_chashuibiao.png";
			break;
		case 16://我想静静
			return @"diamond_gift_woxiangjingjing.png";
			break;
		  default:
			return @"";
					break;
	}
	return imageName;
}


@end
