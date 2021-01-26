//
//  IDKSNativeAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDKSNativeAdLoader.h"
#import <KSAdSDK/KSAdSDK.h>
#import "IDNativeAdConfig.h"
#import "IDKSNativeAdVideoView.h"
#import "IDKSNativeAdSingleImageView.h"

@interface IDKSNativeAdLoader ()<KSNativeAdsManagerDelegate,KSNativeAdDelegate>

@property(nonatomic,strong) IDNativeAdConfig *config;
@property(nonatomic,strong) KSNativeAdsManager *adLoader;
@property(nonatomic,strong) NSMutableArray *adViews;

@end

@implementation IDKSNativeAdLoader

-(void)configApp:(IDADConfig *)config{
    self.config = (IDNativeAdConfig*)config;
}

-(void)loadAdCount:(NSInteger)count{
    
    [KSAdSDKManager setAppId:self.config.appid];
    self.adLoader = [[KSNativeAdsManager alloc]initWithPosId:self.config.pid];
    self.adLoader.delegate = self;
    [self.adLoader loadAdDataWithCount:count];
}

#pragma mark- KSNativeAdsManagerDelegate

- (void)nativeAdsManagerSuccessToLoad:(KSNativeAdsManager *)adsManager nativeAds:(NSArray<KSNativeAd *> *_Nullable)nativeAdDataArray{
    
    self.adViews = [NSMutableArray arrayWithCapacity:nativeAdDataArray.count];
    
    for (KSNativeAd *nativeAd in nativeAdDataArray) {
        
        UIView *adView = nil;
        
        if (nativeAd.data.materialType == KSAdMaterialTypeVideo) {
            IDKSNativeAdVideoView *videoView = [[IDKSNativeAdVideoView alloc]initWithFrame:CGRectMake(0, 0, self.config.nativeAdSize.width, self.config.nativeAdSize.height)];
            [videoView render:nativeAd];
            adView = videoView;
            
        }else if(nativeAd.data.materialType == KSAdMaterialTypeSingle){
            
            IDKSNativeAdSingleImageView *singleImageView = [[IDKSNativeAdSingleImageView alloc]initWithFrame:CGRectMake(0, 0, self.config.nativeAdSize.width, self.config.nativeAdSize.height)];
            [singleImageView render:nativeAd];
            adView = singleImageView;
        }
        nativeAd.delegate  = self;
        nativeAd.rootViewController = self.config.presentViewController;
        
        if (adView) {
            [self.config.delegate idNativeDidLoadSuccessAdView:adView inTotal:self.adViews  loader:self];
        }
    }
}

- (void)nativeAdsManager:(KSNativeAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error{
    
}


#pragma mark- KSNativeAdDelegate


/**
 This method is called when native ad material loaded successfully.
 */
- (void)nativeAdDidLoad:(KSNativeAd *)nativeAd{
    
    
    
}

/**
 This method is called when native ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeAd:(KSNativeAd *)nativeAd didFailWithError:(NSError *_Nullable)error{
    
}

/**
 This method is called when native ad slot has been shown.
 */
- (void)nativeAdDidBecomeVisible:(KSNativeAd *)nativeAd{
    
}

/**
 This method is called when native ad is clicked.
 */
- (void)nativeAdDidClick:(KSNativeAd *)nativeAd withView:(UIView *_Nullable)view{
    
}

/**
 This method is called when another controller has been showed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeAdDidShowOtherController:(KSNativeAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeAdDidCloseOtherController:(KSNativeAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
}


@end
