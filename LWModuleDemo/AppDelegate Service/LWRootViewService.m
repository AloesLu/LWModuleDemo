//
//  LWRootViewService.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/19.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWRootViewService.h"
#import "ViewController.h"

@implementation LWRootViewService

ML_EXPORT_SERVICE(rootViewService)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    application.delegate.window = window;
    
    ViewController* dvc = [[ViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:dvc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
    return YES;
}

@end
