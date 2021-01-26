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

- (void)loadSplashAd {
    
    [KSAdSDKManager setAppId:self.config.appid];
    KSAdSplashManager.posId = self.config.pid;
    KSAdSplashManager.interactDelegate = self;
    
    [KSAdSplashManager loadSplash];
    
    __weak typeof(self) wself = self;
    [KSAdSplashManager checkSplashWithTimeoutv2:self.config.timeout completion:^(KSAdSplashViewController * _Nullable splashViewController, NSError * _Nullable error) {
        
        if (error) {
            [wself ksad_splashAdDidLoadError:error];
        }else{
            wself.splashViewController = splashViewController;
            [wself ksad_splashAdDidLoad];
        }
    }];
}
- (BOOL)isAdReady {
    return self.splashViewController;
}

-(IdADBrand)brand{
    return self.config.brand;
}

- (void)showSplashAd {
    
    [self.config.presentViewController addChildViewController:self.splashViewController];
    self.splashViewController.view.frame = CGRectMake(0, 0, self.config.presentViewController.view.bounds.size.width, self.config.presentViewController.view.bounds.size.height - 120);
    [self.config.presentViewController.view addSubview:self.splashViewController.view];
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
    
    [self.splashViewController.view removeFromSuperview];
    [self.config.delegate idSplashDidSkip:self];
    
}
/**
 * 转化控制器容器，如果未实现则默认闪屏页面的上级控制器
 */
- (UIViewController *)ksad_splashAdConversionRootVC{
    return  self.config.presentViewController;
}


@end
