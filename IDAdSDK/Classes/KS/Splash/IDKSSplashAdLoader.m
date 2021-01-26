//
//  IDKSSplashAdLoader.m
//  IDAD
//
//  Created by Liumao's on 2021/1/22.
//

#import "IDKSSplashAdLoader.h"
#import <KSAdSDK/KSAdSDK.h>
#import "IDSplashAdConfig.h"

@interface IDKSSplashAdLoader ()<KSAdSplashInteractDelegate>

@property(nonatomic,strong) IDSplashAdConfig *config;
@property(nonatomic,strong) KSAdSplashViewController *splashViewController;
@property(nonatomic,assign) BOOL isReady;

@end

@implementation IDKSSplashAdLoader

- (void)configApp:(IDADConfig *)config {
    self.config = (IDSplashAdConfig*)config;
}

- (BOOL)isAdReady {
    return self.splashViewController;
}

- (void)loadSplashAd {
    
    [KSAdSDKManager setAppId:self.config.appid];
    KSAdSplashManager.posId = self.config.pid;
    KSAdSplashManager.interactDelegate = self;
    
    [KSAdSplashManager loadSplash];
    
    [KSAdSplashManager checkSplash:^(KSAdSplashViewController * _Nullable splashViewController) {
        
        if (splashViewController ) {
            
            self.splashViewController = splashViewController;
            [self ksad_splashAdDidLoad];
        }
    }];
}

- (void)showSplashAd {
    
    self.splashViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.config.presentViewController  presentViewController:self.splashViewController animated:YES completion:nil];
}

#pragma mark- KSAdSplashInteractDelegate

//自增 加载成功
- (void)ksad_splashAdDidLoad{
    [self.config.delegate idSplashDidLoadSuccess:self];
}

//自增 加载失败
- (void)ksad_splashAdDidLoadError:(NSError*)error{
    
    [self.config.delegate idSplashDidLoadError:error loader:self];
    
}

/**
 * 闪屏广告展示
 */
- (void)ksad_splashAdDidShow{
    
    [self.config.delegate idSplashDidShow:self];
    
}
/**
 * 闪屏广告点击转化
 */
- (void)ksad_splashAdClicked{
    
    [self.config.delegate idSplashDidClick:self];
    
}
/**
 * 视频闪屏广告开始播放
 */
- (void)ksad_splashAdVideoDidStartPlay{
    
}
/**
 * 视频闪屏广告播放失败
 */
- (void)ksad_splashAdVideoFailedToPlay:(NSError *)error{
    
}
/**
 * 视频闪屏广告跳过
 */
- (void)ksad_splashAdVideoDidSkipped:(NSTimeInterval)playDuration{
    
    [self.config.delegate idSplashDidSkip:self];
    
}
/**
 * 闪屏广告关闭，需要在这个方法里关闭闪屏页面
 * @param converted      是否转化
 */
- (void)ksad_splashAdDismiss:(BOOL)converted{
    
    [self.splashViewController dismissViewControllerAnimated:YES completion:nil];
    
    [self.config.delegate idSplashDidSkip:self];
    
}
/**
 * 转化控制器容器，如果未实现则默认闪屏页面的上级控制器
 */
- (UIViewController *)ksad_splashAdConversionRootVC{
    return  self.config.presentViewController;
}


@end
