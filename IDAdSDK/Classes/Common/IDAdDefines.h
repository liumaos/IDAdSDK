//
//  IDAdDefines.h
//  IDAD
//
//  Created by Liumao's on 2021/1/22.
//

#import <Foundation/Foundation.h>

//广告加载超时时间
static NSInteger ID_AD_TIMEOUT = 3.0;


//三方广告品牌  根据后台配置
typedef NSString *IdADBrand NS_STRING_ENUM;

//蜗牛
FOUNDATION_EXPORT IdADBrand const IdADBrandSnail;
//广点通
FOUNDATION_EXPORT IdADBrand const IdADBrandGDT;
//穿山甲
FOUNDATION_EXPORT IdADBrand const IdADBrandBU;
//快手
FOUNDATION_EXPORT IdADBrand const IdADBrandKS;


//三方广告广告位ID 前端按需配置
typedef NSString *ID3dAdLocation NS_STRING_ENUM;

//开屏
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationSplash;

//社区信息流1
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationCommunityFeed_1;

//社区信息流2
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationCommunityFeed_2;

//帖子内广告
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationCommunityPost;

//评论内广告
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationComment;

//挑战插屏
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationChallenge;

//助眠曲激励视频
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationHelpSleep;

//改善课激励视频
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationImproveClass;

//睡眠详情激励视频
FOUNDATION_EXPORT ID3dAdLocation const ID3dAdLocationSleepDetail;













