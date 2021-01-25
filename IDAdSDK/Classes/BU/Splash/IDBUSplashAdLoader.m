//
//  IDBUSplashAdLoader.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "IDBUSplashAdLoader.h"
#import <BUAdSDK/BUAdSDK.h>
#import "IDADConfig.h"

@interface IDBUSplashAdLoader ()<BUSplashAdDelegate>

@property(nonatomic,strong) IDADConfig *config;
@property(nonatomic,strong) BUSplashAdView *splashView;
@property(nonatomic,assign) BOOL isReady;

@end

@implementation IDBUSplashAdLoader

-(void)configApp:(IDADConfig *)config{
    self.config = config;
}

-(void) loadSplashAd{
    
    [BUAdSDKManager setAppID:self.config.appid];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    BUSplashAdView *splashView =  [[BUSplashAdView alloc]initWithSlotID:self.config.pid
                                                                  frame:frame];
    splashView.delegate = self;
    splashView.tolerateTimeout = self.config.timeout;
    splashView.rootViewController = self.config.presentViewController;
    [splashView loadAdData];
    
    self.splashView = splashView;
}

-(void) showSplashAd{
    
    self.splashView.rootViewController = self.config.presentViewController;
    [[UIApplication sharedApplication].keyWindow addSubview:self.splashView];
}

-(BOOL)isAdReady{
    return  self.splashView.isAdValid;
}

-(NSString *)description{
    return @"穿山甲 - 开屏广告";
}


#pragma mark- BUSplashAdDelegate

- (void)splashAdDidLoad:(BUSplashAdView *)splashAd{
    
    self.isReady = YES;
    
    if ([self.config.delegate respondsToSelector:@selector(idSplashDidLoadSuccess:)]) {
        [self.config.delegate idSplashDidLoadSuccess:self];
    }
}

- (void)splashAd:(BUSplashAdView *)splashAd
didFailWithError:(NSError * _Nullable)error{
    
    if ([self.config.delegate respondsToSelector:@selector(idSplashDidLoadError:loader:)]) {
        [self.config.delegate idSplashDidLoadError:error loader:self];
    }
}


- (void)splashAdWillVisible:(BUSplashAdView *)splashAd{
    
    [self.config.delegate idSplashDidShow:self];
    
}

- (void)splashAdDidClick:(BUSplashAdView *)splashAd{
    
    if ([self.config.delegate respondsToSelector:@selector(idSplashDidClick:)]) {
        [self.config.delegate idSplashDidClick:self];
    }
}

- (void)splashAdDidClose:(BUSplashAdView *)splashAd{
    [self.splashView removeFromSuperview];
    
    [self.config.delegate idSplashDidClose:self];
}

- (void)splashAdWillClose:(BUSplashAdView *)splashAd{
    
}

- (void)splashAdDidCloseOtherController:(BUSplashAdView *)splashAd
                        interactionType:(BUInteractionType)interactionType{
    
}

- (void)splashAdDidClickSkip:(BUSplashAdView *)splashAd{
    
    [self.splashView removeFromSuperview];
    
    
    [self.config.delegate idSplashDidSkip:self];
    
}

- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd{
    
    [self.splashView removeFromSuperview];
    
    [self.config.delegate idSplashDidClose:self];
    
    
}

@end
