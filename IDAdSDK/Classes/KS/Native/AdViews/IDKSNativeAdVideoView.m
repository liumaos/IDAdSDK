//
//  IDKSNativeAdVideoView.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDKSNativeAdVideoView.h"
#import <KSAdSDK/KSAdSDK.h>
#import <Masonry/Masonry.h>

@interface IDKSNativeAdVideoView ()

@property(nonatomic,strong) KSNativeAd *nativeAd;
@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UILabel  *descriptionLabel;

@property (nonatomic, strong) KSNativeAdRelatedView *relatedView;


@end

@implementation IDKSNativeAdVideoView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

-(void) setUpView{
    
    self.relatedView = [KSNativeAdRelatedView new];
    [self addSubview:self.relatedView.videoAdView];
    
    self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.actionButton setTitleColor:[UIColor blueColor]
                            forState:UIControlStateNormal];
    
    [self addSubview:self.actionButton];
    
    self.descriptionLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.descriptionLabel.font = [UIFont systemFontOfSize:10];
    self.descriptionLabel.textColor = [UIColor orangeColor];
    self.descriptionLabel.numberOfLines = 0;
    [self addSubview:self.descriptionLabel];
    
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(-3);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(3);
        make.top.offset(3);
        make.bottom.offset(-3);
        make.right.mas_equalTo(self.relatedView.videoAdView.mas_left).offset(-3);
    }];
    
    [self.relatedView.videoAdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(3);
        make.bottom.offset(-3);
        make.width.mas_equalTo(self).multipliedBy(0.4);
    }];
}

-(void)render:(KSNativeAd *)nativeAd{
    
    [nativeAd registerContainer:self withClickableViews:@[self.actionButton,self.descriptionLabel]];
    
    [self.relatedView refreshData:nativeAd];
    
    [self.actionButton setTitle:nativeAd.data.actionDescription
                       forState:UIControlStateNormal];
    
    self.descriptionLabel.text = nativeAd.data.adDescription;
}

@end
