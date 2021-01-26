//
//  IDNativeAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDNativeAdLoader.h"
#import "IDNativeAdInterface.h"
#import "IDBUNativeAdLoader.h"
#import "IDGDTNativeAdLoader.h"
#import "IDKSNativeAdLoader.h"
#import "IDNativeAdConfig.h"


@interface IDNativeAdLoader ()<IDNtativeAdDelegate>

//广告位
@property(nonatomic,assign) ID3dAdLocation location;
@property(nonatomic,strong) NSArray<IdADBrand> * brands;
@property(nonatomic,weak)   id<IDNativeAdLoaderDelegate>delegate;
@property(assign,readwrite,nonatomic) BOOL hasReadyAd;

@property(nonatomic,strong) NSMutableArray<IDNativeAdInterface>*loaders;
@property(nonatomic,strong) NSMutableArray<IDNativeAdInterface>*successLoaders;
@property(nonatomic,strong) NSMutableArray<IDNativeAdInterface>*failLoaders;

@property(nonatomic,strong) id<IDNativeAdInterface>readyAdLoader;

@end

@implementation IDNativeAdLoader

-(instancetype)initWithBrand:(ID3dAdLocation)location
                      brands:(NSArray<IdADBrand> *)brand
                    delegate:(id<IDNativeAdLoaderDelegate>)delegate{
    
    self = [super init];
    if (self) {
        self.brands = brand;
        self.delegate = delegate;
        self.location = location;
        
        [self prepareAdLoader];
    }
    return self;
}

-(void)prepareAdLoader{
    
    self.loaders = (NSMutableArray<IDNativeAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.failLoaders    = (NSMutableArray<IDNativeAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.successLoaders = (NSMutableArray<IDNativeAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    
    for (IdADBrand brand in self.brands) {
        
        IDNativeAdConfig *buConfig = [IDNativeAdConfig config:brand
                                                     location:self.location];
        
        buConfig.delegate    = self;
        
        buConfig.presentViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        id<IDNativeAdInterface> loader = nil;
        
        if (brand == IdADBrandBU) {
            loader = [IDBUNativeAdLoader new];
        }else if(brand == IdADBrandGDT){
            loader = [IDGDTNativeAdLoader new];
        }else if(brand == IdADBrandKS){
            loader = [IDKSNativeAdLoader new];
        }
        [loader configApp:buConfig];
        [self.loaders addObject:loader];
    }
}

-(void)loadAd:(NSInteger)count{
    
    for (id<IDNativeAdInterface>loader in self.loaders) {
        if ([loader respondsToSelector:@selector(loadAdCount:)]) {
            [loader loadAdCount:count ];
        }
    }
}

#pragma mark- IDNtativeAdDelegate

-(void)idNativeDidLoadSuccessAdView:(UIView *)adView
                            inTotal:(NSArray *)adViews
                             loader:(id)loader{
    
    [self.delegate nativeAdDidLoadSuccess:adView];
}


-(void)idNativeLoader:(id)loader didLoadFail:(NSError *)error{
    
    
}


@end
