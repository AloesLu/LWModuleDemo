//
//  LWAppDelegate.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/19.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWAppDelegate.h"
@interface LWAppDelegate()

@end

@implementation LWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ///------------------------------------------------------------------------------------------┐
    // This file is NOT neccessary. You can use MLSOAppDelegate directly, without any subclasses.│
    ///------------------------------------------------------------------------------------------┘
    // Do something before all other app services
    // ...
    
    // MLSOAppDelegate (the super) does not implement -application:didFinishLaunchingWithOptions: actually.
    // It forwards the message to all registered services.
    // You MUST call super to ensure all registered service implementation get called.
    
    //本文件可以不写，直接在main方法里初始化MLSOAppDelegate
    //MLSOAppDelegate可以转发本方法，到所有继承MLAppService的服务中
    if ([super respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        [super application:application didFinishLaunchingWithOptions:launchOptions];
    }
    return YES;
}

@end
