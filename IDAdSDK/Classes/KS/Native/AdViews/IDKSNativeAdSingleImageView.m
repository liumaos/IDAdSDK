//
//  IDKSNativeAdSingleImageView.m
//  IDAdSDK
//
//  Created by Liumao's on 2021/1/26.
//

#import "IDKSNativeAdSingleImageView.h"
#import <KSAdSDK/KSAdSDK.h>
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>


@interface IDKSNativeAdSingleImageView ()

@property(nonatomic,strong) KSNativeAd *nativeAd;

@property (nonatomic, strong) KSNativeAdRelatedView *relatedView;
@property (nonatomic, strong) UIButton  *actionButton;
@property (nonatomic, strong) UILabel   *descriptionLabel;
@property(nonatomic,strong)   UIImageView *imageView;

@end

@implementation IDKSNativeAdSingleImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

-(void) setUpView{
        
    self.relatedView = [KSNativeAdRelatedView new];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self insertSubview:self.imageView atIndex:0];
    
    [self addSubview:self.relatedView.adLabel];
    
    self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.actionButton setTitleColor:[UIColor blueColor]
                            forState:UIControlStateNormal];
    [self addSubview:self.actionButton];
    
    self.descriptionLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.descriptionLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.descriptionLabel];
    
    
    [self.relatedView.adLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.offset(0);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(3);
        make.bottom.offset(-3);
        make.width.mas_equalTo(self).multipliedBy(0.4);
    }];
    
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
        make.right.mas_equalTo(self.imageView.mas_left).offset(-3);
    }];
}

-(void)render:(KSNativeAd *)nativeAd{
    
    [nativeAd registerContainer:self withClickableViews:@[self.actionButton,self.descriptionLabel,self.imageView]];
    
    [self.actionButton setTitle:nativeAd.data.actionDescription
                       forState:UIControlStateNormal];
    
    self.descriptionLabel.text = nativeAd.data.adDescription;
    
    KSAdImage *image = nativeAd.data.imageArray.firstObject;
    if (image.image) {
        self.imageView.image = image.image;
    }else{
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:image.imageURL]];
    }
}

@end
