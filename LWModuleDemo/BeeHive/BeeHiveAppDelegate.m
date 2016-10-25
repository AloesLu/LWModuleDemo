//
//  BeeHiveAppDelegate.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/24.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "BeeHiveAppDelegate.h"
#import <BeeHive/BHTimeProfiler.h>
#import "RootServiceProtocol.h"

@implementation BeeHiveAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
//    可对module和service进行提前配置
    [BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";
    [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
    
    [BeeHive shareInstance].enableExpection = YES;
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    [[BHTimeProfiler sharedTimeProfiler] recordEventTime:@"BeeHive::super start launch"];
    
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    id<RootServiceProtocol> rootVC = [[BeeHive shareInstance] createService:@protocol(RootServiceProtocol)];
    rootVC.moduleAName=@"BeeHive";
    
    
    if ([rootVC isKindOfClass:[UIViewController class]]) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)rootVC];
        
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = navCtrl;
        
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

@end
