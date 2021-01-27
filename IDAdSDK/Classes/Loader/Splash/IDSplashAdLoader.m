//
//  IDSplashAdLoader.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "IDSplashAdLoader.h"
#import "IDSplashAdInterface.h"
#import "IDSplashAdDelegate.h"
#import "IDBUSplashAdLoader.h"
#import "IDGDTSplashAdLoader.h"
#import "IDKSSplashAdLoader.h"
#import "IDSplashAdConfig.h"

@interface IDSplashAdLoader ()<IDSplashAdDelegate>

//广告位
@property(nonatomic,assign) ID3dAdLocation location;
@property(nonatomic,strong) NSArray<IdADBrand> * brands;
@property(nonatomic,weak)   id<IDSplashAdLoaderDelegate>delegate;
@property(assign,readwrite,nonatomic) BOOL hasReadyAd;

@property(nonatomic,strong) NSMutableArray<IDSplashAdInterface>*loaders;

@property(nonatomic,strong) NSMutableArray<IDSplashAdInterface>*successLoaders;
@property(nonatomic,strong) NSMutableArray<IDSplashAdInterface>*failLoaders;

@property(nonatomic,strong) id<IDSplashAdInterface>readyAdLoader;


@end

@implementation IDSplashAdLoader


-(instancetype)initWithBrand:(ID3dAdLocation)location brands:(nonnull NSArray<IdADBrand> *)brands delegate:(nonnull id<IDSplashAdLoaderDelegate>)delegate{
    self = [super init];
    
    if (self) {
        self.location = location;
        self.delegate = delegate;
        self.brands   = brands;
        [self prepareAdLoader];
    }
    return self;
}

-(BOOL)hasReadyAd{
    return self.readyAdLoader;
}

-(IdADBrand)successShowBrand{
    return self.readyAdLoader.adConfig.brand;
}
-(NSString *)successShowPid{
    return self.readyAdLoader.adConfig.pid;
}

//添加品牌广告Loader
-(void)prepareAdLoader{
    
    self.loaders = (NSMutableArray<IDSplashAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.failLoaders    = (NSMutableArray<IDSplashAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.successLoaders = (NSMutableArray<IDSplashAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    
    
    for (IdADBrand brand in self.brands) {
        
        IDSplashAdConfig *buConfig = [IDSplashAdConfig config:brand
                                                     location:self.location];
        
        buConfig.delegate    = self;
        buConfig.presentViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        id<IDSplashAdInterface> loader = nil;
        
        if (brand == IdADBrandBU) {
            loader = [IDBUSplashAdLoader new];
        }else if(brand == IdADBrandGDT){
            loader = [IDGDTSplashAdLoader new];
        }else if(brand == IdADBrandKS){
            loader = [IDKSSplashAdLoader new];
        }
        
        [loader configApp:buConfig];
        [self.loaders addObject:loader];
    }
}

//加载广告
-(void)loadSplashAd{
    
    for (id<IDSplashAdInterface>loader in self.loaders) {
        
        if ([loader respondsToSelector:@selector(loadSplashAd)]) {
            [loader loadSplashAd];
        }
    }
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ID_AD_TIMEOUT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself outTimeCheak];
    });
}

//展示广告
-(void) showSplashAd{
    
    if ([self.readyAdLoader respondsToSelector:@selector(showSplashAd)]) {
        [self.readyAdLoader showSplashAd];
    }
}

//回调结果检测
-(void) resultCheckLoader{
    
    //已有准备的Loader
    if (self.readyAdLoader) {
        return;
    }
    //成功时
    for (id<IDSplashAdInterface> loader in self.loaders) {
        
        if ([self.failLoaders containsObject:loader]) {
            continue;
        }
        if ([self.successLoaders containsObject:loader]) {
            //第一顺位加载成功
            self.readyAdLoader = loader;
            [self.delegate splashAdLoaderDidReady:self];
            return;
        }else{
            //第一顺位还没加载完成
            return;
        }
    }
}

//超时检测
-(void) outTimeCheak{
    
    for (id<IDSplashAdInterface> loader in self.loaders) {
        
        if ([self.successLoaders containsObject:loader]) {
            //成功
            self.readyAdLoader = loader;
            [self.delegate splashAdLoaderDidReady:self];
            return;
        }
    }
    //失败
    [self.delegate splashAdLoaderDidError:self];
}

#pragma mark- IDSplashAdDelegate

-(void)idSplashDidLoadSuccess:(id<IDSplashAdInterface>)loader{
    
    NSLog(@"-->%@ %s",loader,__func__);
    
    [self.successLoaders addObject:loader];
    
    [self resultCheckLoader];
    
}

-(void)idSplashDidLoadError:(NSError *)error
                     loader:(id<IDSplashAdInterface>)loader{
    
    NSLog(@"-->%@ %s \nError:%@",loader,__func__,error);
    
    [self.failLoaders addObject:loader];
    
    //全部失败
    if (self.failLoaders.count == self.loaders.count) {
        [self.delegate splashAdLoaderDidError:self];
        return;
    }
}


-(void)idSplashDidShow:(id<IDSplashAdInterface>)loader{
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(splashAdLoaderDidClose:)]) {
        [self.delegate splashAdLoaderDidShow:self];
    }
}


-(void)idSplashDidClick:(id<IDSplashAdInterface>)loader{
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(splashAdLoaderDidClose:)]) {
        [self.delegate splashAdLoaderDidClick:self];
    }
}

-(void)idSplashDidClose:(id<IDSplashAdInterface>)loader{
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(splashAdLoaderDidClose:)]) {
        [self.delegate splashAdLoaderDidClose:self];
    }
}

-(void)idSplashDidSkip:(id<IDSplashAdInterface>)loader{
    NSLog(@"-->%@ %s",loader,__func__);
    
    if ([self.delegate respondsToSelector:@selector(splashAdLoaderDidSkip:)]) {
        [self.delegate splashAdLoaderDidSkip:self];
    }
}




@end
