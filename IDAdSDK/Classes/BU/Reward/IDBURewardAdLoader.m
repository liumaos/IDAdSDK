//
//  IDBURewardLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDBURewardAdLoader.h"
#import "IDRewardAdConfig.h"
#import <BUAdSDK/BUAdSDK.h>

@interface IDBURewardAdLoader()<BUNativeExpressRewardedVideoAdDelegate>
@property(nonatomic,strong) IDRewardAdConfig *config;
@property(nonatomic,strong) BUNativeExpressRewardedVideoAd *rewardLoader;

@end
@implementation IDBURewardAdLoader

-(void)configApp:(IDRewardAdConfig *)config{
    self.config = config;
}

-(void)loadRewardAd{
    
    [BUAdSDKManager setAppID:self.config.appid];
    
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    model.userId = @"123";
    self.rewardLoader = [[BUNativeExpressRewardedVideoAd alloc]initWithSlotID:self.config.pid rewardedVideoModel:model];;
    self.rewardLoader.delegate = self;
    
    [self.rewardLoader loadAdData];
}

-(void)showRewardAd{
    
    [self.rewardLoader showAdFromRootViewController:self.config.presentViewController];
}

- (IDADConfig *)adConfig {
    return self.config;
}

#pragma mark- BUNativeExpressRewardedVideoAdDelegate


/**
 This method is called when video ad material loaded successfully.
 */
- (void)nativeExpressRewardedVideoAdDidLoad:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    [self.config.delegate idRewardAdVideoDidLoad:self];
    
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    
    
}
/**
 this methods is to tell delegate the type of native express rewarded video Ad
 */
- (void)nativeExpressRewardedVideoAdCallback:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd withType:(BUNativeExpressRewardedVideoAdType)nativeExpressVideoType{
    
    
}

/**
 This method is called when cached successfully.
 For a better user experience, it is recommended to display video ads at this time.
 And you can call [BUNativeExpressRewardedVideoAd showAdFromRootViewController:].
 */
- (void)nativeExpressRewardedVideoAdDidDownLoadVideo:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 It will happen when ad is show.
 */
- (void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error{
    
    
    
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)nativeExpressRewardedVideoAdWillVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
    
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressRewardedVideoAdDidVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when video ad is about to close.
 */
- (void)nativeExpressRewardedVideoAdWillClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when the user clicked skip button.
 */
- (void)nativeExpressRewardedVideoAdDidClickSkip:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd{
    
    
}

/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    
    
}

/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
 1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidSucceed:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify{
    
    
}


/**
 Server verification which is requested asynchronously is failed.
 @param rewardedVideoAd express rewardVideo Ad
 @param error request error info
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error{
    
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressRewardedVideoAdDidCloseOtherController:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd interactionType:(BUInteractionType)interactionType{
    
    
}

@end
