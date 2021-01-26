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

-(IdADBrand)brand{
    return self.config.brand;
}

-(UIView *)lastAdView{
    if (self.adViews.count) {
        return self.adViews.lastObject;
    }
    return nil;
}

#pragma mark- KSFeedAdsManagerDelegate

- (void)feedAdsManagerSuccessToLoad:(KSFeedAdsManager *)adsManager nativeAds:(NSArray<KSFeedAd *> *_Nullable)feedAdDataArray{
    
    self.adViews = [NSMutableArray arrayWithCapacity:feedAdDataArray.count];
    self.feeds   = feedAdDataArray;
    
    for (KSFeedAd *feed in feedAdDataArray) {
        
        [self.adViews addObject:feed.feedView];
        [self.config.delegate idNativeDidLoadSuccessAdView:feed.feedView inTotal:self.adViews loader:self];
        feed.delegate = self;
    }
}

- (void)feedAdsManager:(KSFeedAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error{
    
}

#pragma mark- KSFeedAdDelegate

- (void)feedAdViewWillShow:(KSFeedAd *)feedAd{
    
}
- (void)feedAdDidClick:(KSFeedAd *)feedAd{
    
}
- (void)feedAdDislike:(KSFeedAd *)feedAd{
    
    
}
- (void)feedAdDidShowOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
    
}
- (void)feedAdDidCloseOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
    
}



@end
