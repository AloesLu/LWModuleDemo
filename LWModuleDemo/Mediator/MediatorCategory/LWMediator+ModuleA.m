//
//  LWMediator+ModuleA.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWMediator+ModuleA.h"
#import "ModuleA1ViewControllerProtocol.h"
#import "LWProtocolManager.h"

@implementation LWMediator (ModuleA)

+ (UIViewController<ModuleA1ViewControllerProtocol>*)protocolGoToModuleA:(NSString*)moduleAName {
    id<ModuleA1ViewControllerProtocol> t1VC = [[LWProtocolManager sharedManager] createInstanceFromProtocol:@protocol(ModuleA1ViewControllerProtocol)];
    if ([t1VC respondsToSelector:@selector(setModuleAName:)]) {
        [t1VC setModuleAName:moduleAName];
    }
    if ([t1VC isKindOfClass:[UIViewController class]]) {
        return (UIViewController<ModuleA1ViewControllerProtocol>*)t1VC;
    }
    return nil;
}

+ (void)urlGoToModuleA:(NSString*)moduleAName {
    id<ModuleA1ViewControllerProtocol> t1VC = [[LWProtocolManager sharedManager] createInstanceFromProtocol:@protocol(ModuleA1ViewControllerProtocol)];
    if ([t1VC respondsToSelector:@selector(setModuleAName:)]) {
        [t1VC setModuleAName:moduleAName];
    }
    if ([t1VC isKindOfClass:[UIViewController class]]) {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:(UIViewController*)t1VC animated:YES completion:NULL];
    }
}
@end
