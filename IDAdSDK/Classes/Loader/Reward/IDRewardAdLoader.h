//
//  IDRewardAdLoader.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "IDAdDefines.h"
#import "IDRewardAdLoaderDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface IDRewardAdLoader : NSObject

/// 初始化
/// @param location 广告位置
/// @param brand 有序 品牌 数组
/// @param delegate  回调
-(instancetype) initWithBrand:(ID3dAdLocation)location
                       brands:(NSArray<IdADBrand>*)brand
                     delegate:(id<IDRewardAdLoaderDelegate>)delegate;

//被展示品牌
@property(assign,readonly,nonatomic) IdADBrand successShowBrand;

//被展示品牌Pid
@property(copy,readonly,nonatomic) NSString *successShowPid;
 

//加载广告
-(void) loadRewardAd;

//展示广告
-(void) showRewardAd;

@end

NS_ASSUME_NONNULL_END
