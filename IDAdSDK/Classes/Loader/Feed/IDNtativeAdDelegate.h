//
//  IDNtativeAdDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDNtativeAdDelegate_h
#define IDNtativeAdDelegate_h

@protocol IDNtativeAdDelegate <NSObject>

-(void) idNativeDidLoadSuccessAdView:(UIView*)adView
                            inTotal :(NSArray*)adViews
                              loader:(id)loader;

-(void) idNativeLoader:(id)loader
           didLoadFail:(NSError*)error;

@end

#endif /* IDNtativeAdDelegate_h */
