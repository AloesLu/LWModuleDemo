//
//  LWNotificationService.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/19.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWNotificationService.h"
#import <UserNotifications/UserNotifications.h>

@implementation LWNotificationService
ML_EXPORT_SERVICE(notificationService)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        NSLog(@"App was launched by remote notification.");
    } else if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        NSLog(@"App was launched by local notification.");
    }
    [self registerUserNotifications:application launchOptions:launchOptions];
    return YES;
}


- (void)registerUserNotifications:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error) {
                [application registerForRemoteNotifications];
                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    if (settings.notificationCenterSetting == UNNotificationSettingEnabled) {
                        
                    }
                }];
            } else {
                NSLog(@"%@",error);
            }
        }];
        
    }else{
        UIUserNotificationType types = (UIUserNotificationTypeBadge|
                                        UIUserNotificationTypeSound|
                                        UIUserNotificationTypeAlert);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), deviceToken);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
}
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), notificationSettings);
    [application registerForRemoteNotifications];
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), userInfo);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}
@end
