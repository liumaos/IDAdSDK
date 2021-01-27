//
//  IDBURewardLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDBURewardAdLoader.h"
#import "IDRewardAdConfig.h"
#import <BUAdSDK/BUAdSDK.h>

@interface IDBURewardAdLoader ()<BUNativeExpresInterstitialAdDelegate>
@property(nonatomic,strong) IDRewardAdConfig *config;
@property(nonatomic,strong) BUNativeExpressInterstitialAd *rewardLoader;

@end
@implementation IDBURewardAdLoader

-(void)configApp:(IDRewardAdConfig *)config{
    self.config = config;
}

-(void)loadRewardAd{
    
    [BUAdSDKManager setAppID:self.config.appid];
    self.rewardLoader = [[BUNativeExpressInterstitialAd alloc]initWithSlotID:self.config.pid adSize:CGSizeZero];
    self.rewardLoader.delegate = self;
    
    [self.rewardLoader loadAdData];
}

-(void)showRewardAd{
    
    [self.rewardLoader showAdFromRootViewController:self.config.presentViewController];
}

- (IDADConfig *)adConfig {
    return self.config;
}

#pragma mark- BUNativeExpresInterstitialAdDelegate

/**
 This method is called when interstitial ad material loaded successfully.
 */
- (void)nativeExpresInterstitialAdDidLoad:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad material failed to load.
 @param error : the reason of error
 */
- (void)nativeExpresInterstitialAd:(BUNativeExpressInterstitialAd *)interstitialAd didFailWithError:(NSError * __nullable)error{
    
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpresInterstitialAdRenderSuccess:(BUNativeExpressInterstitialAd *)interstitialAd{
    
    [self.config.delegate idRewardAdVideoDidLoad:self];
    
}


/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpresInterstitialAdRenderFail:(BUNativeExpressInterstitialAd *)interstitialAd error:(NSError * __nullable)error{
    
}

/**
 This method is called when interstitial ad slot will be showing.
 */
- (void)nativeExpresInterstitialAdWillVisible:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is clicked.
 */
- (void)nativeExpresInterstitialAdDidClick:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is about to close.
 */
- (void)nativeExpresInterstitialAdWillClose:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is closed.
 */
- (void)nativeExpresInterstitialAdDidClose:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpresInterstitialAdDidCloseOtherController:(BUNativeExpressInterstitialAd *)interstitialAd interactionType:(BUInteractionType)interactionType{
    
}


@end
