//
//  IDADConfig.h
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IDSplashAdDelegate.h"
#import "IDAdDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface IDADConfig : NSObject

//广告品牌
@property(nonatomic,assign) IdADBrand brand;

//广告位
@property(nonatomic,assign) ID3dAdLocation location;

///应用ID
@property(nonatomic,copy) NSString *appid;

///位置ID
@property(nonatomic,copy) NSString *pid;

///广告代理
@property(nonatomic,weak) id<IDSplashAdDelegate>delegate;

///上层控制器
@property(nonatomic,weak) UIViewController *presentViewController;

///超时时长
@property(nonatomic,assign) NSInteger timeout;


+(instancetype) config:(IdADBrand)brand location:(ID3dAdLocation)location;

@end

NS_ASSUME_NONNULL_END
