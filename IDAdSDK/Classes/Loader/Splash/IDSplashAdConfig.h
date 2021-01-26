//
//  IDSplashAdConfig.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "IDADConfig.h"


NS_ASSUME_NONNULL_BEGIN

@interface IDSplashAdConfig : IDADConfig

///广告代理
@property(nonatomic,weak) id<IDSplashAdDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
