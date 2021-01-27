//
//  IDGDTRewardAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDGDTRewardAdLoader.h"
#import <GDTMobSDK/GDTSDKConfig.h>
#import <GDTMobSDK/GDTNativeExpressRewardVideoAd.h>
#import "IDRewardAdConfig.h"

@interface IDGDTRewardAdLoader ()<GDTNativeExpressRewardedVideoAdDelegate>

@property(nonatomic,strong) IDRewardAdConfig *config;
@property(nonatomic,strong) GDTNativeExpressRewardVideoAd *rewardLoader;



@end

@implementation IDGDTRewardAdLoader

-(void)configApp:(IDRewardAdConfig *)config{
    self.config = config;
}
-(void)loadRewardAd{
    
    [GDTSDKConfig registerAppId:self.config.appid];
    self.rewardLoader = [[GDTNativeExpressRewardVideoAd alloc]initWithPlacementId:self.config.pid];
    self.rewardLoader.delegate = self;
}

-(void)showRewardAd{
    
    [self.rewardLoader showAdFromRootViewController:self.config.presentViewController];
}

- (IDADConfig *)adConfig {
    return  self.config;
}

#pragma mark- GDTNativeExpressRewardedVideoAdDelegate


/**
 广告数据加载成功回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdDidLoad:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频数据下载成功回调，已经下载过的视频会直接回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdVideoDidLoad:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频播放页即将展示回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdWillVisible:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频广告曝光回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdDidExposed:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频播放页关闭回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdDidClose:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频广告信息点击回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */

-(void)gdt_nativeExpressRewardVideoAdDidClicked:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

/**
 视频广告各种错误信息回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)gdt_nativeExpressRewardVideoAd:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error{
    
}


/**
 视频广告播放达到激励条件回调
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdDidRewardEffective:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd info:(NSDictionary *)info{
    
}

/**
 视频广告视频播放完成
 
 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_nativeExpressRewardVideoAdDidPlayFinish:(GDTNativeExpressRewardVideoAd *)rewardedVideoAd{
    
}

@end
