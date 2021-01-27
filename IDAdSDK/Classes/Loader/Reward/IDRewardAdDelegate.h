//
//  IDRewardAdDelegate.h
//  Pods
//
//  Created by Liumao's on 2021/1/26.
//

#ifndef IDRewardAdDelegate_h
#define IDRewardAdDelegate_h

@protocol IDRewardAdDelegate <NSObject>

//广告加载成功
-(void) idRewardAdDidLoadSuccess:(id)loader;

//广告加载失败
-(void) idRewardAdDidLoad:(id)loader error:(NSError*)error;

//广告视频加载成功
-(void) idRewardAdVideoDidLoad:(id)loader;

//曝光
-(void) idRewardAdVideoDidShow:(id)loader;

//点击
-(void) idRewardAdVideoDidClick:(id)loader;

//跳过
-(void) idRewardAdVideoDidSkip:(id)loader;

//关闭
-(void) idRewardAdVideoDidClose:(id)loader;

//获得奖励
-(void) idRewardAdVideoDidRewarded:(id)loader;

@end

#endif /* IDRewardAdDelegate_h */
