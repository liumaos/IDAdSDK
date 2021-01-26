//
//  IDNativeAdInterface.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//


#ifndef IDNativeAdInterface_h
#define IDNativeAdInterface_h

#import "IDAdDefines.h"

@class IDADConfig;

@protocol IDNativeAdInterface <NSObject>

-(void) configApp:(IDADConfig*)config;

-(void) loadAdCount:(NSInteger)count;

-(IdADBrand) brand;

-(UIView*) lastAdView;

@end


#endif /* IDNativeAdInterface_h */
