//
//  IDNativeAdConfig.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "IDADConfig.h"
#import "IDNtativeAdDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface IDNativeAdConfig : IDADConfig

@property(nonatomic,weak) id<IDNtativeAdDelegate> delegate;

///原生广告尺寸
@property(nonatomic,assign) CGSize nativeAdSize;

@end

NS_ASSUME_NONNULL_END
