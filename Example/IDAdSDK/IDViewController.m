//
//  IDViewController.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "IDViewController.h"
#import "IDSplashAdLoader.h"

@interface IDViewController ()<IDSplashAdLoaderDelegate>

@property(nonatomic,strong)  IDSplashAdLoader *splashLoader;

@end

@implementation IDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.splashLoader = [[IDSplashAdLoader alloc]initWithBrand:ID3dAdLocationSplash brands:@[IdADBrandBU] delegate:self];
}

-(void)splashAdLoaderDidReady:(IDSplashAdLoader *)loader{
    
    [self.splashLoader showSplashAd];
    
    NSLog(@"%@ %s",loader,__func__);
    
}

-(void)splashAdLoaderDidError:(IDSplashAdLoader *)loader{
    
    NSLog(@"%@ %s",loader,__func__);
    
}

- (IBAction)loadAd:(UIButton *)sender {
    
    [self.splashLoader loadSplashAd];
    
}


@end
