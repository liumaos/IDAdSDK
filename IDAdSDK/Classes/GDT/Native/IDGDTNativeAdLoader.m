//
//  IDGDTNativeAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDGDTNativeAdLoader.h"
#import <GDTMobSDK/GDTSDKConfig.h>
#import <GDTMobSDK/GDTNativeExpressAd.h>
#import <GDTMobSDK/GDTNativeExpressAdView.h>

#import "IDNativeAdConfig.h"

@interface IDGDTNativeAdLoader ()<GDTNativeExpressAdDelegete>

@property(nonatomic,strong) GDTNativeExpressAd *adLoader;
@property(nonatomic,strong) IDNativeAdConfig *config;
@property(nonatomic,strong) NSMutableArray *adViews;

@end

@implementation IDGDTNativeAdLoader

-(void)configApp:(IDADConfig *)config{
    self.config = (IDNativeAdConfig*)config;
}

-(void)loadAdCount:(NSInteger)count{
    
    [GDTSDKConfig registerAppId:self.config.appid];
    
    self.adLoader = [[GDTNativeExpressAd alloc]initWithPlacementId:self.config.pid adSize:self.config.nativeAdSize];
    self.adLoader.delegate = self;
    [self.adLoader loadAd:count];
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

#pragma mark- GDTNativeExpressAdDelegete

- (void)nativeExpressAdSuccessToLoad:(GDTNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof GDTNativeExpressAdView *> *)views{
    
    self.adViews = [NSMutableArray arrayWithCapacity:views.count];
    
    for (GDTNativeExpressAdView *adView in views) {
        [adView render];
        adView.controller = self.config.presentViewController;
    }
}

/**
 * 拉取原生模板广告失败
 */
- (void)nativeExpressAdFailToLoad:(GDTNativeExpressAd *)nativeExpressAd error:(NSError *)error{
    
    [self.config.delegate idNativeLoader:self didLoadFail:error];
}

/**
 * 原生模板广告渲染成功, 此时的 nativeExpressAdView.size.height 根据 size.width 完成了动态更新。
 */
- (void)nativeExpressAdViewRenderSuccess:(GDTNativeExpressAdView *)nativeExpressAdView{
    
    [self.adViews addObject:nativeExpressAdView];
    [self.config.delegate idNativeDidLoadSuccessAdView:nativeExpressAdView inTotal:self.adViews loader:self];
}

/**
 * 原生模板广告渲染失败
 */
- (void)nativeExpressAdViewRenderFail:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生模板广告曝光回调
 */
- (void)nativeExpressAdViewExposure:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生模板广告点击回调
 */
- (void)nativeExpressAdViewClicked:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生模板广告被关闭
 */
- (void)nativeExpressAdViewClosed:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 点击原生模板广告以后即将弹出全屏广告页
 */
- (void)nativeExpressAdViewWillPresentScreen:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 点击原生模板广告以后弹出全屏广告页
 */
- (void)nativeExpressAdViewDidPresentScreen:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 全屏广告页将要关闭
 */
- (void)nativeExpressAdViewWillDismissScreen:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 全屏广告页将要关闭
 */
- (void)nativeExpressAdViewDidDismissScreen:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 详解:当点击应用下载或者广告调用系统程序打开时调用
 */
- (void)nativeExpressAdViewApplicationWillEnterBackground:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生模板视频广告 player 播放状态更新回调
 */
- (void)nativeExpressAdView:(GDTNativeExpressAdView *)nativeExpressAdView playerStatusChanged:(GDTMediaPlayerStatus)status{
    
}

/**
 * 原生视频模板详情页 WillPresent 回调
 */
- (void)nativeExpressAdViewWillPresentVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生视频模板详情页 DidPresent 回调
 */
- (void)nativeExpressAdViewDidPresentVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生视频模板详情页 WillDismiss 回调
 */
- (void)nativeExpressAdViewWillDismissVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}

/**
 * 原生视频模板详情页 DidDismiss 回调
 */
- (void)nativeExpressAdViewDidDismissVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView{
    
}




@end
