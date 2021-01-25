//
//  IDSplashAdDelegate.h
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//


#import <Foundation/Foundation.h>
#import "IDSplashAdInterface.h"

#ifndef IDSplashAdDelegate_h
#define IDSplashAdDelegate_h

@protocol IDSplashAdDelegate <NSObject>

//加载成功
-(void) idSplashDidLoadSuccess:(id<IDSplashAdInterface>)loader;

//加载失败
-(void) idSplashDidLoadError:(NSError*)error
                    loader:(id<IDSplashAdInterface>)loader;

//曝光
-(void) idSplashDidShow:(id<IDSplashAdInterface>)loader;


//广告点击
-(void) idSplashDidClick:(id<IDSplashAdInterface>)loader;


//广告关闭
-(void) idSplashDidClose:(id<IDSplashAdInterface>)loader;


//广告跳过
-(void) idSplashDidSkip:(id<IDSplashAdInterface>)loader;


@end



#endif /* IDSplashAdDelegate_h */
