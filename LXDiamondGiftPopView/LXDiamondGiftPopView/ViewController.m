//
//  ViewController.m
//  LXDiamondGiftPopView
//
//  Created by 邱学伟 on 2017/5/18.
//  Copyright © 2017年 邱学伟. All rights reserved.
//

#import "ViewController.h"
#import "LXDiamondGiftPopView.h"
#import "LXDiamondGiftPopModel.h"
#import "GiftModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
//	LXDiamondGiftPopView *diamondGiftPopView = [LXDiamondGiftPopView loadFromNib];
//	diamondGiftPopView.frame = CGRectMake(0, 0, 200, 275);
//	diamondGiftPopView.center = self.view.center;
//	[self.view addSubview:diamondGiftPopView];
	
	[self show];
}

- (void)show {
	
	GiftModel *giftModel = [[GiftModel alloc] init];
	giftModel.giftID = @"11";
	giftModel.giftName = @"666";
	giftModel.giftPrice = @"60";
	
	LXDiamondGiftPopModel *model = [[LXDiamondGiftPopModel alloc] init];
	model.giftModel = giftModel;
	model.nextShowDiamondGiftPopTimeDistance = @"10分钟后的礼物倍儿棒, 千万别急着颠儿";
	model.surplusCountForDiamondGiftPop = @"剩余14次捡钻石机会";
	
	[LXDiamondGiftPopView showDiamondGiftPopViewWithModle:model isFinishedShowDiamondAnimation:^(BOOL isFinishedShowDiamondAnimation) {
		NSLog(@"+++  结束了!!");
	} inSuperView:self.view];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self show];
}

@end
