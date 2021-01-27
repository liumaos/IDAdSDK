//
//  IDRewardAdConfig.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "IDADConfig.h"
#import "IDRewardAdDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface IDRewardAdConfig : IDADConfig

@property(nonatomic,weak) id<IDRewardAdDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
