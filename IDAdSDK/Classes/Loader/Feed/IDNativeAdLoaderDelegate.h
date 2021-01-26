//
//  IDNativeAdLoaderDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDNativeAdLoaderDelegate_h
#define IDNativeAdLoaderDelegate_h

@class IDNativeAdLoader;

@protocol IDNativeAdLoaderDelegate <NSObject>

//成功
-(void) nativeAdDidLoadSuccess:(IDNativeAdLoader*)loader
                        adView:(UIView*)adView;
//失败
-(void) nativeAdDidLoadFail:(IDNativeAdLoader*)loader
                      error:(NSError*)error;

//曝光
-(void) nativeAdWillShow:(IDNativeAdLoader*)loader;

//点击后展示
-(void) nativeAdDidPresent:(IDNativeAdLoader*)loader;

//展示后关闭
-(void) nativeAdDidClose:(IDNativeAdLoader*)loader;

//点击
-(void) nativeAdDidClick:(IDNativeAdLoader*)loader;



@end


#endif /* IDNativeAdLoaderDelegate_h */
