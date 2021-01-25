//
//  IDGDTSplashAdLoader.m
//  IDAD
//
//  Created by Liumao's on 2021/1/22.
//

#import "IDGDTSplashAdLoader.h"
#import <GDTMobSDK/GDTSplashAd.h>
#import <GDTMobSDK/GDTSDKConfig.h>
#import "IDADConfig.h"


@interface IDGDTSplashAdLoader ()<GDTSplashAdDelegate>

@property(nonatomic,strong) IDADConfig *config;
@property(nonatomic,strong) GDTSplashAd *splashAd;

@end

@implementation IDGDTSplashAdLoader


-(void)configApp:(IDADConfig *)config{
    self.config = config;
}

-(void)loadSplashAd{
    
    [GDTSDKConfig registerAppId:self.config.appid];
    
    GDTSplashAd *splashAd = [[GDTSplashAd alloc]initWithPlacementId:@"73646b0499021991"];
    splashAd.delegate = self;
    splashAd.fetchDelay = self.config.timeout;
    [splashAd loadAd];
    self.splashAd = splashAd;
    
}

-(void)showSplashAd{
    
    [self.splashAd showAdInWindow:[UIApplication sharedApplication].keyWindow
                   withBottomView:nil
                         skipView:nil];
}

- (BOOL)isAdReady {
    return self.splashAd.isAdValid;
}


#pragma mark- GDTSplashAdDelegate

/**
 *  开屏广告成功展示
 */
- (void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd{
    
    
}

/**
 *  开屏广告素材加载成功
 */
- (void)splashAdDidLoad:(GDTSplashAd *)splashAd{
    [self.config.delegate idSplashDidLoadSuccess:self];
}

/**
 *  开屏广告展示失败
 */
- (void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error{

    [self.config.delegate idSplashDidLoadError:error loader:self];
        
}

/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd{
    
}

/**
 *  开屏广告曝光回调
 */
- (void)splashAdExposured:(GDTSplashAd *)splashAd{
    
    [self.config.delegate idSplashDidShow:self];
}

/**
 *  开屏广告点击回调
 */
- (void)splashAdClicked:(GDTSplashAd *)splashAd{
    
    [self.config.delegate idSplashDidClick:self];
    
}

/**
 *  开屏广告将要关闭回调
 */
- (void)splashAdWillClosed:(GDTSplashAd *)splashAd{
    
}

/**
 *  开屏广告关闭回调
 */
- (void)splashAdClosed:(GDTSplashAd *)splashAd{
    
    [self.config.delegate idSplashDidClose:self];

}

/**
 *  开屏广告点击以后即将弹出全屏广告页
 */
- (void)splashAdWillPresentFullScreenModal:(GDTSplashAd *)splashAd{
    
}

/**
 *  开屏广告点击以后弹出全屏广告页
 */
- (void)splashAdDidPresentFullScreenModal:(GDTSplashAd *)splashAd{
    
}

/**
 *  点击以后全屏广告页将要关闭
 */
- (void)splashAdWillDismissFullScreenModal:(GDTSplashAd *)splashAd{
    
}

/**
 *  点击以后全屏广告页已经关闭
 */
- (void)splashAdDidDismissFullScreenModal:(GDTSplashAd *)splashAd{
    
}

/**
 * 开屏广告剩余时间回调
 */
- (void)splashAdLifeTime:(NSUInteger)time{
    
}



@end
