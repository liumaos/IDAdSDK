//
//  IDSplashAdInterface.h
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#ifndef IDSplashAdInterface_h
#define IDSplashAdInterface_h

@class IDADConfig;

@protocol IDSplashAdInterface <NSObject>

-(void) configApp:(IDADConfig*)config;

-(void) loadSplashAd;

-(void) showSplashAd;

-(BOOL) isAdReady;

@end

#endif /* IDSplashAdInterface_h */
