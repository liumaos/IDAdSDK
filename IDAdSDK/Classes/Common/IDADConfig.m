//
//  IDADConfig.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "IDADConfig.h"
#import "UIApplication+Top.h"

@implementation IDADConfig


+(instancetype)config:(IdADBrand)brand
             location:(ID3dAdLocation)location{
    return [[self alloc]initWith:brand
                        location:location];
}
-(instancetype)initWith:(IdADBrand)brand
               location:(ID3dAdLocation)location{
    self = [super init];
    if (self) {
        self.brand    = brand;
        self.location = location;
    }
    return self;
}

-(UIViewController *)presentViewController{
    return _presentViewController?:[UIApplication topViewController];
}

-(NSString *)appid{
    return [self appIdDict][self.brand];
}

-(NSString *)pid{
    return [self appAdPidDict][self.brand][self.location];
}

-(NSInteger)timeout{
    return MAX(_timeout, ID_AD_TIMEOUT);
}

-(NSDictionary*)appIdDict{
    
    return @{
        IdADBrandGDT :@"1111150250",
        IdADBrandBU  :@"5060084",
        IdADBrandKS  :@"516400025"
    };
}


-(NSDictionary*)appAdPidDict{
    
    return @{
        IdADBrandGDT : @{
                ID3dAdLocationSplash         : @"1051239930816247",
                ID3dAdLocationCommunityFeed_1: @"4071452521564922",
                ID3dAdLocationCommunityFeed_2: @"4071452521564922",
                ID3dAdLocationCommunityPost  : @"2001251541073058",
                ID3dAdLocationComment        : @"2001251541073058",
                ID3dAdLocationChallenge      : @"7071455571675173",
                ID3dAdLocationHelpSleep      : @"7081551531674156",
                ID3dAdLocationImproveClass   : @"7031857521270159",
                ID3dAdLocationSleepDetail    : @"2061152511279220"
        },
        IdADBrandBU  :@{
                ID3dAdLocationSplash         : @"887315301",
                ID3dAdLocationCommunityFeed_1: @"945332191",
                ID3dAdLocationCommunityFeed_2: @"945332191",
                ID3dAdLocationCommunityPost  : @"945389640",
                ID3dAdLocationComment        : @"945389640",
                ID3dAdLocationChallenge      : @"945587994",
                ID3dAdLocationHelpSleep      : @"945334992",
                ID3dAdLocationImproveClass   : @"945393748",
                ID3dAdLocationSleepDetail    : @"945675545"
        },
        IdADBrandKS  :@{
                ID3dAdLocationSplash         : @"5164000505",
                ID3dAdLocationCommunityFeed_1: @"5164000514",
                ID3dAdLocationCommunityFeed_2: @"5164000514",
                ID3dAdLocationCommunityPost  : @"5164000516",
                ID3dAdLocationComment        : @"5164000516",
                ID3dAdLocationChallenge      : @"5164000518",
                ID3dAdLocationHelpSleep      : @"5164000519",
                ID3dAdLocationImproveClass   : @"5164000520",
                ID3dAdLocationSleepDetail    : @"5164000521"
        }
    };
}

@end
