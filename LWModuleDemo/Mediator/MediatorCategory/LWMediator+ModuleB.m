//
//  LWMediator+ModuleB.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWMediator+ModuleB.h"
#import "ModuleB1ViewControllerProtocol.h"
#import "LWProtocolManager.h"

@implementation LWMediator (ModuleB)
+ (UIViewController<ModuleB1ViewControllerProtocol>*)protocolGoToModuleB:(NSString*)moduleBTitle {
    id<ModuleB1ViewControllerProtocol> t1VC = [[LWProtocolManager sharedManager] createInstanceFromProtocol:@protocol(ModuleB1ViewControllerProtocol)];
    if ([t1VC respondsToSelector:@selector(setModuleBTitle:)]) {
        [t1VC setModuleBTitle:moduleBTitle];
    }
    if ([t1VC isKindOfClass:[UIViewController class]]) {
        return (UIViewController<ModuleB1ViewControllerProtocol>*)t1VC;
    }
    return nil;
}

+ (UIViewController<ModuleB1ViewControllerProtocol>*)urlGoToModuleB:(NSString*)moduleBTitle {
    id<ModuleB1ViewControllerProtocol> t1VC = [[LWProtocolManager sharedManager] createInstanceFromProtocol:@protocol(ModuleB1ViewControllerProtocol)];
    if ([t1VC respondsToSelector:@selector(setModuleBTitle:)]) {
        [t1VC setModuleBTitle:moduleBTitle];
    }
    if ([t1VC isKindOfClass:[UIViewController class]]) {
        return (UIViewController<ModuleB1ViewControllerProtocol>*)t1VC;
    }
    return nil;
}
@end
