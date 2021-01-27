//
//  IDGDTRewardAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDGDTRewardAdLoader.h"
#import <GDTMobSDK/GDTSDKConfig.h>
#import <GDTMobSDK/GDTRewardVideoAd.h>
#import "IDRewardAdConfig.h"

@interface IDGDTRewardAdLoader ()<GDTRewardedVideoAdDelegate>

@property(nonatomic,strong) IDRewardAdConfig *config;
@property(nonatomic,strong) GDTRewardVideoAd *rewardLoader;

@end

@implementation IDGDTRewardAdLoader

-(void)configApp:(IDRewardAdConfig *)config{
    self.config = config;
}
-(void)loadRewardAd{
    
    [GDTSDKConfig registerAppId:self.config.appid];
    self.rewardLoader = [[GDTRewardVideoAd alloc]initWithPlacementId:self.config.pid];
    self.rewardLoader.delegate = self;
    [self.rewardLoader loadAd];
}

-(void)showRewardAd{
    
    [self.rewardLoader showAdFromRootViewController:self.config.presentViewController];
}

- (IDADConfig *)adConfig {
    return  self.config;
}

#pragma mark- GDTNativeExpressRewardedVideoAdDelegate

//没有Skip

/**
 广告数据加载成功回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidLoad:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdDidLoadSuccess:self];
    
}

/**
 视频数据下载成功回调，已经下载过的视频会直接回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdVideoDidLoad:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidLoad:self];
}

/**
 视频播放页即将展示回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdWillVisible:(GDTRewardVideoAd *)rewardedVideoAd{
    
    
}

/**
 视频广告曝光回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidExposed:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidShow:self];
    
}

/**
 视频播放页关闭回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClose:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidClose:self];
    
}

/**
 视频广告信息点击回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClicked:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidClick:self];
    
}

/**
 视频广告各种错误信息回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)gdt_rewardVideoAd:(GDTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error{
    
    [self.config.delegate idRewardAdDidLoad:self error:error];
}

/**
 视频广告播放达到激励条件回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param info 包含此次广告行为的一些信息，例如 @{@"GDT_TRANS_ID":@"930f1fc8ac59983bbdf4548ee40ac353"}, 通过@“GDT_TRANS_ID”可获取此次广告行为的交易id
 */
- (void)gdt_rewardVideoAdDidRewardEffective:(GDTRewardVideoAd *)rewardedVideoAd info:(NSDictionary *)info{
    
    
}

/**
 视频广告视频播放完成
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidPlayFinish:(GDTRewardVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidRewarded:self];
}


@end
