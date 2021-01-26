//
//  IDTestLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDTestLoader.h"
#import <BUAdSDK/BUNativeExpressAdView.h>
#import <BUAdSDK/BUNativeAdsManager.h>
#import <BUAdSDK/BUAdSDK.h>
#import <GDTMobSDK/GDTNativeExpressAd.h>
#import <KSAdSDK/KSNativeAd.h>

@implementation IDTestLoader


-(void)loadBUNativeAd{
    
    BUAdSlot *slot = [[BUAdSlot alloc]init];
    slot.AdType = BUAdSlotAdTypeFeed;
    slot.position = BUAdSlotPositionFeed;
    
    //    BUSize *size = [BUSize sizeBy:BUProposalSize_Feed228_150];
    
    [[BUNativeExpressAdManager alloc]initWithSlot:slot adSize:CGSizeZero];
    [[[BUNativeExpressAdManager alloc]init]loadAdDataWithCount:3];
    
}


-(void)loadGDTNativeAd{
    
    [[GDTNativeExpressAd alloc]initWithPlacementId:@"" adSize:CGSizeZero];
    [[GDTNativeExpressAd new]loadAd:3];
    
}

-(void)loadKSNativeAd{
    
    [[KSNativeAd alloc]initWithPosId:@""];
    [[KSNativeAd new]loadAdData];
    
}





@end
