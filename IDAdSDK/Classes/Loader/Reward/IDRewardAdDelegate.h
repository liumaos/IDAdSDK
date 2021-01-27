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

@end

#endif /* IDRewardAdDelegate_h */
