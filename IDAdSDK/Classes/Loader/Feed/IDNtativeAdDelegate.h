//
//  IDNtativeAdDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDNtativeAdDelegate_h
#define IDNtativeAdDelegate_h

@protocol IDNtativeAdDelegate <NSObject>

-(void) idNativeLoader:(id)loader
        didLoadSuccess:(UIView*)adView
              inTotal :(NSArray*)adViews;

-(void) idNativeLoader:(id)loader
           didLoadFail:(NSError*)error;

-(void) idNativeLoaderWillShow:(id)loader;

-(void) idNativeLoaderDidClick:(id)loader;

-(void) idNativeLoaderDidPresent:(id)loader;

-(void) idNativeLoaderDidClose:(id)loader;

        
@end

#endif /* IDNtativeAdDelegate_h */
