#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IDBUSplashAdLoader.h"
#import "IDADConfig.h"
#import "IDAdDefines.h"
#import "UIApplication+Top.h"
#import "IDAdLoaderFactory.h"
#import "IDGDTSplashAdLoader.h"
#import "IDKSSplashAdLoader.h"
#import "IDSplashAdDelegate.h"
#import "IDSplashAdInterface.h"
#import "IDSplashAdLoader.h"

FOUNDATION_EXPORT double IDAdSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char IDAdSDKVersionString[];

