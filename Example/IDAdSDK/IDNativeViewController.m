//
//  IDNativeViewController.m
//  IDAdSDK_Example
//
//  Created by Liumao's on 2021/1/26.
//  Copyright © 2021 wangwei. All rights reserved.
//

#import "IDNativeViewController.h"
#import "IDNativeAdLoader.h"



@interface IDNativeViewController ()<IDNativeAdLoaderDelegate>

@property(nonatomic,strong) IDNativeAdLoader *nativeLoader;
@end

@implementation IDNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nativeLoader = [[IDNativeAdLoader alloc]initWithBrand:ID3dAdLocationCommunityFeed_1 brands:@[IdADBrandBU] delegate:self];
    [self.nativeLoader loadAd:1];
}


- (void)nativeAdDidLoadFail:(NSError *)error {
    
    
}

- (void)nativeAdDidLoadSuccess:(UIView *)adView {
    [self.view addSubview:adView];
    
    adView.backgroundColor = [UIColor lightGrayColor];
    adView.center = self.view.center;
    
}

- (void)nativeAdDidClick:(IDNativeAdLoader *)loader {
    
}

- (void)nativeAdDidClose:(IDNativeAdLoader *)loader {
    
}

- (void)nativeAdDidLoadFail:(IDNativeAdLoader *)loader error:(NSError *)error {
    
}

- (void)nativeAdDidLoadSuccess:(IDNativeAdLoader *)loader adView:(UIView *)adView {
    
}

- (void)nativeAdDidPresent:(IDNativeAdLoader *)loader {
    
}

- (void)nativeAdWillShow:(IDNativeAdLoader *)loader {
    
}


@end
