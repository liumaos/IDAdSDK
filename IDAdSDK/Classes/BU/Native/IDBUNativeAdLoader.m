//
//  IDBUNativeAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDBUNativeAdLoader.h"
#import <BUAdSDK/BUAdSDK.h>
#import "IDNativeAdConfig.h"

@interface IDBUNativeAdLoader ()<BUNativeExpressAdViewDelegate>

@property(nonatomic,strong) IDNativeAdConfig *config;

@property(nonatomic,strong) BUNativeExpressAdManager *adManager;

@property(nonatomic,strong) NSMutableArray *adViews;

@end

@implementation IDBUNativeAdLoader

- (void)configApp:(IDADConfig *)config{
    self.config = (IDNativeAdConfig*)config;
}

-(void)loadAdCount:(NSInteger)count{
    
    [BUAdSDKManager setAppID:self.config.appid];
    
    BUAdSlot *slot = [[BUAdSlot alloc]init];
    slot.AdType = BUAdSlotAdTypeFeed;
    slot.position = BUAdSlotPositionFeed;
    slot.ID = self.config.pid;
    
    self.adManager = [[BUNativeExpressAdManager alloc]initWithSlot:slot adSize:self.config.nativeAdSize];
    self.adManager.delegate = self;
    [self.adManager loadAdDataWithCount:count];
    
}

-(IdADBrand)brand{
    return self.config.brand;
}

-(UIView *)lastAdView{
    if (self.adViews.count) {
        return self.adViews.lastObject;
    }
    return nil;
}

-(NSString *)description{
    return @"穿山甲 原生Feed流";
}

#pragma mark- BUNativeExpressAdViewDelegate

- (void)nativeExpressAdSuccessToLoad:(BUNativeExpressAdManager *)nativeExpressAdManager views:(NSArray<__kindof BUNativeExpressAdView *> *)views{
    
    self.adViews = [NSMutableArray arrayWithCapacity:views.count];
    
    for (BUNativeExpressAdView *adView in views) {
        [adView render];
        adView.rootViewController = self.config.presentViewController;
    }
}

/**
 * Sent when views fail to load ad
 */
- (void)nativeExpressAdFailToLoad:(BUNativeExpressAdManager *)nativeExpressAdManager error:(NSError *_Nullable)error{
    
    [self.config.delegate idNativeLoader:self didLoadFail:error];
}

/**
 * This method is called when rendering a nativeExpressAdView successed, and nativeExpressAdView.size.height has been updated
 */
- (void)nativeExpressAdViewRenderSuccess:(BUNativeExpressAdView *)nativeExpressAdView{
    
    [self.adViews addObject:nativeExpressAdView];
    
    [self.config.delegate idNativeLoader:self
                          didLoadSuccess:nativeExpressAdView
                                 inTotal:self.adViews];
}

/**
 * This method is called when a nativeExpressAdView failed to render
 */
- (void)nativeExpressAdViewRenderFail:(BUNativeExpressAdView *)nativeExpressAdView error:(NSError *_Nullable)error{
    
    
    [self.config.delegate idNativeLoader:self didLoadFail:error];
    
}

/**
 * Sent when an ad view is about to present modal content
 */
- (void)nativeExpressAdViewWillShow:(BUNativeExpressAdView *)nativeExpressAdView{
    
    [self.config.delegate idNativeLoaderWillShow:self];
    
}

/**
 * Sent when an ad view is clicked
 */
- (void)nativeExpressAdViewDidClick:(BUNativeExpressAdView *)nativeExpressAdView{
    
    [self.config.delegate idNativeLoaderDidClick:self];
    
}

/**
 Sent when a playerw playback status changed.
 @param playerState : player state after changed
 */
- (void)nativeExpressAdView:(BUNativeExpressAdView *)nativeExpressAdView stateDidChanged:(BUPlayerPlayState)playerState{
    
}

/**
 * Sent when a player finished
 * @param error : error of player
 */
- (void)nativeExpressAdViewPlayerDidPlayFinish:(BUNativeExpressAdView *)nativeExpressAdView error:(NSError *)error{
    
}

/**
 * Sent when a user clicked dislike reasons.
 * @param filterWords : the array of reasons why the user dislikes the ad
 */
- (void)nativeExpressAdView:(BUNativeExpressAdView *)nativeExpressAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterWords{
    
}

/**
 * Sent after an ad view is clicked, a ad landscape view will present modal content
 */
- (void)nativeExpressAdViewWillPresentScreen:(BUNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressAdViewDidCloseOtherController:(BUNativeExpressAdView *)nativeExpressAdView interactionType:(BUInteractionType)interactionType{
    
}




@end
