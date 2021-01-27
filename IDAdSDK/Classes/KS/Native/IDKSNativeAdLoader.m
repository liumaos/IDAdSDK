//
//  IDKSNativeAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDKSNativeAdLoader.h"
#import <KSAdSDK/KSAdSDK.h>
#import "IDNativeAdConfig.h"

@interface IDKSNativeAdLoader ()<KSFeedAdsManagerDelegate,KSFeedAdDelegate>

@property(nonatomic,strong) IDNativeAdConfig *config;
@property(nonatomic,strong) KSFeedAdsManager *adLoader;
@property(nonatomic,strong) NSMutableArray   *adViews;
@property(nonatomic,strong) NSArray          *feeds;

@end

@implementation IDKSNativeAdLoader

-(void)configApp:(IDADConfig *)config{
    self.config = (IDNativeAdConfig*)config;
}

-(void)loadAdCount:(NSInteger)count{
    
    [KSAdSDKManager setAppId:self.config.appid];
    
    self.adLoader = [[KSFeedAdsManager alloc]initWithPosId:self.config.pid size:self.config.nativeAdSize];
    self.adLoader.delegate = self;
    
    [self.adLoader loadAdDataWithCount:count];
}

-(IDADConfig*)adConfig{
    return self.config;
}

-(UIView *)lastAdView{
    if (self.adViews.count) {
        return self.adViews.lastObject;
    }
    return nil;
}

-(NSString *)description{
    return @"快手 原生Feed流";
}

#pragma mark- KSFeedAdsManagerDelegate

- (void)feedAdsManagerSuccessToLoad:(KSFeedAdsManager *)adsManager nativeAds:(NSArray<KSFeedAd *> *_Nullable)feedAdDataArray{
    
    self.adViews = [NSMutableArray arrayWithCapacity:feedAdDataArray.count];
    self.feeds   = feedAdDataArray;
    
    for (KSFeedAd *feed in feedAdDataArray) {
        
        [self.adViews addObject:feed.feedView];
        feed.delegate = self;
        
        [self.config.delegate idNativeLoader:self didLoadSuccess:feed.feedView inTotal:self.adViews];
    }
}

- (void)feedAdsManager:(KSFeedAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error{
    
    [self.config.delegate idNativeLoader:self didLoadFail:error];
}

#pragma mark- KSFeedAdDelegate

- (void)feedAdViewWillShow:(KSFeedAd *)feedAd{
    [self.config.delegate idNativeLoaderWillShow:self];
    
}
- (void)feedAdDidClick:(KSFeedAd *)feedAd{
    
    [self.config.delegate idNativeLoaderDidClick:self];
    
}
- (void)feedAdDislike:(KSFeedAd *)feedAd{
    
    
}
- (void)feedAdDidShowOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
    
}
- (void)feedAdDidCloseOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
    
}



@end
