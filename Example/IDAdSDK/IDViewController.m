//
//  IDViewController.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "IDViewController.h"
#import "IDSplashAdLoader.h"
#import "IDNativeViewController.h"
#import "IDRewardAdLoader.h"


@interface IDViewController ()<IDSplashAdLoaderDelegate,IDRewardAdLoaderDelegate>

@property(nonatomic,strong)  IDSplashAdLoader *splashLoader;

@property(nonatomic,strong)  IDRewardAdLoader *rewardLoader;

@end

@implementation IDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.splashLoader = [[IDSplashAdLoader alloc]initWithBrand:ID3dAdLocationSplash brands:@[IdADBrandKS] delegate:self];
    self.rewardLoader = [[IDRewardAdLoader alloc]initWithBrand:ID3dAdLocationSleepDetail brands:@[IdADBrandBU] delegate:self];
}

-(void)splashAdLoaderDidReady:(IDSplashAdLoader *)loader{
    
    [self.splashLoader showSplashAd];
    
    NSLog(@"%@ %s",loader,__func__);
    
}

-(void)splashAdLoaderDidError:(IDSplashAdLoader *)loader{
    
    NSLog(@"%@ %s",loader,__func__);
    
}

- (void)splashAdLoaderDidClick:(nonnull IDSplashAdLoader *)loader {
    
}


- (void)splashAdLoaderDidClose:(nonnull IDSplashAdLoader *)loader {
    
}


- (void)splashAdLoaderDidShow:(nonnull IDSplashAdLoader *)loader {
    
}


- (void)splashAdLoaderDidSkip:(nonnull IDSplashAdLoader *)loader {
    
}

- (IBAction)loadAd:(UIButton *)sender {
    
    [self.splashLoader loadSplashAd];
    
}
- (IBAction)nativeAd:(UIButton *)sender {
    
    [self.navigationController pushViewController:[IDNativeViewController new] animated:YES];
}



- (IBAction)rewardAd:(UIButton *)sender {
    
    [self.rewardLoader loadRewardAd];
    
}



@end
