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

-(IdADBrand)successShowBrand{
    return self.readyAdLoader.adConfig.brand;
}

-(NSString *)successShowPid{
    return self.readyAdLoader.adConfig.pid;
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
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ID_AD_TIMEOUT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself outTimeCheak];
    });
}

//回调结果检测
-(void) resultCheckLoader{
    
    //已有准备的Loader
    if (self.readyAdLoader) {
        return;
    }
    //成功时
    for (id<IDNativeAdInterface> loader in self.loaders) {
        
        if ([self.failLoaders containsObject:loader]) {
            continue;
        }
        if ([self.successLoaders containsObject:loader]) {
            //第一顺位加载成功
            self.readyAdLoader = loader;
            
            if ([self.delegate respondsToSelector:@selector(idNativeLoader:didLoadSuccess:inTotal:)]) {
                
                [self.delegate nativeAdDidLoadSuccess:self adView:loader.lastAdView];
            }
            
            return;
        }else{
            //第一顺位还没加载完成
            return;
        }
    }
}

//超时检测
-(void) outTimeCheak{
    
    for (id<IDNativeAdInterface> loader in self.loaders) {
        if ([self.successLoaders containsObject:loader]) {
            //成功
            self.readyAdLoader = loader;
            
            if ([self.delegate respondsToSelector:@selector(nativeAdDidLoadSuccess:adView:)]) {
                
                [self.delegate nativeAdDidLoadSuccess:self adView:loader.lastAdView];
            }
            return;
        }
    }
    //失败
    
    if ([self.delegate respondsToSelector:@selector(nativeAdDidLoadFail:error:)]) {
        [self.delegate nativeAdDidLoadFail:self error:nil];
    }
}

#pragma mark- IDNtativeAdDelegate

-(void)idNativeLoader:(id)loader didLoadSuccess:(UIView *)adView inTotal:(NSArray *)adViews{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    [self.successLoaders addObject:loader];
    [self resultCheckLoader];
}


-(void)idNativeLoader:(id)loader didLoadFail:(NSError *)error{
    
    
    NSLog(@"-->%@ %s \nError:%@",loader,__func__,error);
    
    [self.failLoaders addObject:loader];
    
    //全部失败
    if (self.failLoaders.count == self.loaders.count) {
        
        if ([self.delegate respondsToSelector:@selector(nativeAdDidLoadFail:error:)]) {
            [self.delegate nativeAdDidLoadFail:self error:nil];
        }
        return;
    }
}

-(void)idNativeLoaderWillShow:(id)loader{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(nativeAdWillShow:)]) {
        [self.delegate nativeAdWillShow:self];
    }
}

-(void)idNativeLoaderDidClick:(id)loader{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(nativeAdDidClick:)]) {
        [self.delegate nativeAdDidClick:self];
    }
}

-(void)idNativeLoaderDidClose:(id)loader{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(nativeAdDidClose:)]) {
        [self.delegate nativeAdDidClose:self];
    }
}

-(void)idNativeLoaderDidPresent:(id)loader{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(nativeAdDidPresent:)]) {
        [self.delegate nativeAdDidPresent:self];
    }
}


@end
