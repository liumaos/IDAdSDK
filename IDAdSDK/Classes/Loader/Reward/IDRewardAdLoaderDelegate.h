//
//  IDRewardAdLoaderDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDRewardAdLoaderDelegate_h
#define IDRewardAdLoaderDelegate_h

@class IDRewardAdLoader;
@protocol IDRewardAdLoaderDelegate <NSObject>

//广告可播放展示 调用展示方法
-(void) rewardAdDidReady:(IDRewardAdLoader*)loader;

//广告拉取成功
-(void) rewardAdDidLoad:(IDRewardAdLoader*)loader;

//广告拉取失败
-(void) rewardAdDidLoad:(IDRewardAdLoader*)loader error:(NSError*)error;;

//广告视频下载成功
-(void) rewardAdDidVideoLoad:(IDRewardAdLoader*)loader;

//点击
-(void) rewardAdDidClick:(IDRewardAdLoader*)loader;

//跳过
-(void) rewardAdDidSkip:(IDRewardAdLoader*)loader;

//关闭
-(void) rewardAdDidClose:(IDRewardAdLoader*)loader;

//展示
-(void) rewardAdDidShow:(IDRewardAdLoader*)loader;

//获得奖励
-(void) rewardAdDidRewarded:(IDRewardAdLoader*)loader;

@end

#endif /* IDRewardAdLoaderDelegate_h */
