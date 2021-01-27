//
//  IDRewardAdLoader.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDRewardAdLoader.h"
#import "IDRewardAdInterface.h"
#import "IDRewardAdConfig.h"
#import "IDBURewardAdLoader.h"
#import "IDGDTRewardAdLoader.h"
#import "IDKSRewardAdLoader.h"

@interface IDRewardAdLoader ()<IDRewardAdDelegate>

//广告位
@property(nonatomic,assign) ID3dAdLocation location;
@property(nonatomic,strong) NSArray<IdADBrand> * brands;
@property(nonatomic,weak)   id<IDRewardAdLoaderDelegate>delegate;
@property(assign,readwrite,nonatomic) BOOL hasReadyAd;

@property(nonatomic,strong) NSMutableArray<IDRewardAdInterface>*loaders;

@property(nonatomic,strong) NSMutableArray<IDRewardAdInterface>*successLoaders;
@property(nonatomic,strong) NSMutableArray<IDRewardAdInterface>*failLoaders;

@property(nonatomic,strong) id<IDRewardAdInterface>readyAdLoader;



@end

@implementation IDRewardAdLoader

-(instancetype)initWithBrand:(ID3dAdLocation)location brands:(NSArray<IdADBrand> *)brand delegate:(id<IDRewardAdLoaderDelegate>)delegate{
    self = [super init];
    if (self) {
        self.brands = brand;
        self.location = location;
        self.delegate = delegate;
        [self prepareAdLoader];
    }
    return self;
}


//添加品牌广告Loader
-(void)prepareAdLoader{
    
    self.loaders = (NSMutableArray<IDRewardAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.failLoaders    = (NSMutableArray<IDRewardAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    self.successLoaders = (NSMutableArray<IDRewardAdInterface>*)[NSMutableArray arrayWithCapacity:self.brands.count];
    
    for (IdADBrand brand in self.brands) {
        
        IDRewardAdConfig *buConfig = [IDRewardAdConfig config:brand
                                                     location:self.location];
        buConfig.delegate    = self;
        buConfig.presentViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        id<IDRewardAdInterface> loader = nil;
        
        if (brand == IdADBrandBU) {
            loader = [IDBURewardAdLoader new];
        }else if(brand == IdADBrandGDT){
            loader = [IDGDTRewardAdLoader new];
        }else if(brand == IdADBrandKS){
            loader = [IDKSRewardAdLoader new];
        }
        [loader configApp:buConfig];
        [self.loaders addObject:loader];
    }
}


-(void)loadRewardAd{
    
    for (id<IDRewardAdInterface>loader in self.loaders) {
        if ([loader respondsToSelector:@selector(loadRewardAd)]) {
            [loader loadRewardAd];
        }
    }
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ID_AD_TIMEOUT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself outTimeCheak];
    });
}

-(void)showRewardAd{
    [self.readyAdLoader showRewardAd];
}


-(IdADBrand)successShowBrand{
    return self.readyAdLoader.adConfig.brand;
}

-(NSString *)successShowPid{
    return self.readyAdLoader.adConfig.pid;
}

//回调结果检测
-(void) resultCheckLoader{
    
    //已有准备的Loader
    if (self.readyAdLoader) {
        return;
    }
    //成功时
    for (id<IDRewardAdInterface> loader in self.loaders) {
        
        if ([self.failLoaders containsObject:loader]) {
            continue;
        }
        if ([self.successLoaders containsObject:loader]) {
            //第一顺位加载成功
            self.readyAdLoader = loader;
            [self.delegate rewardAdDidReady:self];
            return;
        }else{
            //第一顺位还没加载完成
            return;
        }
    }
}

//超时检测
-(void) outTimeCheak{
    
    for (id<IDRewardAdInterface> loader in self.loaders) {
        
        if ([self.successLoaders containsObject:loader]) {
            //成功
            self.readyAdLoader = loader;
            [self.delegate rewardAdDidReady:self];
            return;
        }
    }
    //失败
    [self.delegate rewardAdDidLoad:self error:nil];
}

#pragma mark- IDRewardAdDelegate

- (void)idRewardAdDidLoad:(id)loader
                    error:(NSError *)error {
    
    [self.failLoaders addObject:loader];
    
    //全部失败
    if (self.failLoaders.count == self.loaders.count) {
        [self.delegate rewardAdDidLoad:self error:error];
        return;
    }
}

- (void)idRewardAdDidLoadSuccess:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidLoad:)]) {
        [self.delegate rewardAdDidLoad:self];
    }
}

- (void)idRewardAdVideoDidLoad:(id)loader {
    
    [self.successLoaders addObject:loader];
    [self resultCheckLoader];
}

- (void)idRewardAdVideoDidClick:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidClick:)]) {
        [self.delegate rewardAdDidClick:self];
    }
}

- (void)idRewardAdVideoDidClose:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidClose:)]) {
        [self.delegate rewardAdDidClose:self];
    }
}

- (void)idRewardAdVideoDidRewarded:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidRewarded:)]) {
        [self.delegate rewardAdDidRewarded:self];
    }
    
}

- (void)idRewardAdVideoDidShow:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidShow:)]) {
        [self.delegate rewardAdDidShow:self];
    }
}

- (void)idRewardAdVideoDidSkip:(id)loader {
    
    if ([self.delegate respondsToSelector:@selector(rewardAdDidSkip:)]) {
        [self.delegate rewardAdDidSkip:self];
    }
    
}

@end
