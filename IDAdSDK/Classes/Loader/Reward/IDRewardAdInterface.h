//
//  IDRewardAdInterface.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDRewardAdConfig.h"

#ifndef IDRewardAdInterface_h
#define IDRewardAdInterface_h

@protocol IDRewardAdInterface <NSObject>

-(void) configApp:(IDRewardAdConfig*)config;

-(void) loadRewardAd;

-(void) showRewardAd;

-(IDADConfig*) adConfig;

@end

#endif /* IDRewardAdInterface_h */
