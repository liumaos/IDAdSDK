//
//  IDNativeAdLoader.h
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "IDAdDefines.h"
#import "IDNativeAdLoaderDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface IDNativeAdLoader : NSObject

-(instancetype) initWithBrand:(ID3dAdLocation)location
                       brands:(NSArray<IdADBrand>*)brand
                     delegate:(id<IDNativeAdLoaderDelegate>)delegate;

@property(nonatomic,strong) IdADBrand brand;

-(void) loadAd:(NSInteger)count;


@end

NS_ASSUME_NONNULL_END
