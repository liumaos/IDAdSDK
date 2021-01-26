//
//  IDKSNativeAdVideoView.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <UIKit/UIKit.h>

@class KSNativeAd;
NS_ASSUME_NONNULL_BEGIN

@interface IDKSNativeAdVideoView : UIView

-(void)render:(KSNativeAd *)nativeAd;

@end

NS_ASSUME_NONNULL_END
