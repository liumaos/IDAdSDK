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

//成功 有可展示时调用
-(void) splashAdLoaderDidReady:(IDSplashAdLoader*)loader;

//失败 全部失败时调用
-(void) splashAdLoaderDidError:(IDSplashAdLoader*)loader;

//关闭
-(void) splashAdLoaderDidClose:(IDSplashAdLoader*)loader;

//跳过
-(void) splashAdLoaderDidSkip:(IDSplashAdLoader*)loader;

//点击
-(void) splashAdLoaderDidClick:(IDSplashAdLoader*)loader;

//曝光
-(void) splashAdLoaderDidShow:(IDSplashAdLoader*)loader;


@end

@interface IDSplashAdLoader : NSObject

/// 初始化
/// @param location 广告位置
/// @param brand 有序 品牌 数组
/// @param delegate  回调
-(instancetype) initWithBrand:(ID3dAdLocation)location
                       brands:(NSArray<IdADBrand>*)brand
                     delegate:(id<IDSplashAdLoaderDelegate>)delegate;


//是否有准备好的广告
@property(assign,readonly,nonatomic) BOOL hasReadyAd;

//被展示品牌
@property(assign,readonly,nonatomic) IdADBrand successShowBrand;
 
//加载广告
-(void) loadSplashAd;

//展示广告
-(void) showSplashAd;

@end

NS_ASSUME_NONNULL_END
