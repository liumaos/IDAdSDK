//
//  IDSplashAdLoader.h
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import <Foundation/Foundation.h>
#import "IDAdDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class IDSplashAdLoader;

@protocol IDSplashAdLoaderDelegate <NSObject>

//成功
-(void) splashAdLoaderDidReady:(IDSplashAdLoader*)loader;

//失败
-(void) splashAdLoaderDidError:(IDSplashAdLoader*)loader;

@end

@interface IDSplashAdLoader : NSObject

/// 初始化
/// @param location 广告位置
/// @param brand 有序 品牌 数组
/// @param delegate  回调
-(instancetype) initWithBrand:(ID3dAdLocation)location
                       brands:(NSArray<IdADBrand>*)brand
                     delegate:(id<IDSplashAdLoaderDelegate>)delegate;


@property(assign,readonly,nonatomic) BOOL hasReadyAd;

-(void) loadSplashAd;

-(void) showSplashAd;

@end

NS_ASSUME_NONNULL_END
