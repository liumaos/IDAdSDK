//
//  IDKSNativeAdSingleImageView.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <UIKit/UIKit.h>

@class KSNativeAd;

NS_ASSUME_NONNULL_BEGIN

@interface IDKSNativeAdSingleImageView : UIView

@property(nonatomic,readonly,strong) KSNativeAd *nativeAd;

-(void) render:(KSNativeAd*)nativeAd;

@end

NS_ASSUME_NONNULL_END
