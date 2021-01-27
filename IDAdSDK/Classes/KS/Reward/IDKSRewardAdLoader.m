//
//  IDKSRewardLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDKSRewardAdLoader.h"
#import "IDRewardAdConfig.h"
#import <KSAdSDK/KSAdSDK.h>

@interface IDKSRewardAdLoader ()<KSRewardedVideoAdDelegate>

@property(nonatomic,strong) IDRewardAdConfig *config;

@property(nonatomic,strong) KSRewardedVideoAd *rewardAd;

@end

@implementation IDKSRewardAdLoader

-(void)configApp:(IDRewardAdConfig *)config{
    self.config = config;
}
-(void)loadRewardAd{
    
    [KSAdSDKManager setAppId:self.config.appid];
    
    KSRewardedVideoModel *model = [[KSRewardedVideoModel alloc]init];
    self.rewardAd = [[KSRewardedVideoAd alloc]initWithPosId:self.config.pid rewardedVideoModel:model];
    self.rewardAd.delegate = self;
    [self.rewardAd loadAdData];
}

-(void)showRewardAd{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.rewardAd showAdFromRootViewController:self.config.presentViewController];
    });
}

-(IDADConfig *)adConfig{
    return self.config;
}

#pragma mark- KSRewardedVideoAdDelegate

/**
 This method is called when video ad material loaded successfully.
 */
- (void)rewardedVideoAdDidLoad:(KSRewardedVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdDidLoadSuccess:self];
    
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    
    [self.config.delegate idRewardAdDidLoad:self error:error];

}
/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdVideoDidLoad:(KSRewardedVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidLoad:self];

}

/**
 This method is called when video ad slot will be showing.
 */
- (void)rewardedVideoAdWillVisible:(KSRewardedVideoAd *)rewardedVideoAd{
    
}
/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(KSRewardedVideoAd *)rewardedVideoAd{
    
    
    [self.config.delegate idRewardAdVideoDidShow:self];
    
}
/**
 This method is called when video ad is about to close.
 */
- (void)rewardedVideoAdWillClose:(KSRewardedVideoAd *)rewardedVideoAd{
    
}
/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(KSRewardedVideoAd *)rewardedVideoAd{
 
    [self.config.delegate idRewardAdVideoDidClose:self];
    
}

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(KSRewardedVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidClick:self];
    
}
/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    
}
/**
 This method is called when the user clicked skip button.
 */
- (void)rewardedVideoAdDidClickSkip:(KSRewardedVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidSkip:self];
    
}
/**
 This method is called when the video begin to play.
 */
- (void)rewardedVideoAdStartPlay:(KSRewardedVideoAd *)rewardedVideoAd{
    
    
}
/**
 This method is called when the user close video ad.
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd hasReward:(BOOL)hasReward{
    
    if (hasReward) {
        [self.config.delegate idRewardAdVideoDidRewarded:self];
    }
    
}


@end
