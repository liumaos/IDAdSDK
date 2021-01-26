//
//  IDNativeAdLoaderDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDNativeAdLoaderDelegate_h
#define IDNativeAdLoaderDelegate_h

@protocol IDNativeAdLoaderDelegate <NSObject>

-(void) nativeAdDidLoadSuccess:(UIView*)adView;

-(void) nativeAdDidLoadFail:(NSError*)error;

@end


#endif /* IDNativeAdLoaderDelegate_h */
