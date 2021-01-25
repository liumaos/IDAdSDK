//
//  UIApplication+Top.m
//  IDAD
//
//  Created by Liumao's on 2021/1/21.
//

#import "UIApplication+Top.h"

@implementation UIApplication (Top)

+(UIViewController*)topViewController{
    return [[UIApplication sharedApplication]topViewController];
}

-(UIViewController*)topViewController{
    
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (true) {
        
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            return vc;
        }
    }
    return  nil;
}

@end
