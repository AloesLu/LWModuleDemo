//
//  RootModule.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/24.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "RootModule.h"
#import <BeeHive/BeeHive.h>
#import "RootViewController.h"
#import "RootServiceProtocol.h"

@interface RootModule()<BHModuleProtocol>

@end

@implementation RootModule

//是否异步加载动态组件，当没有在BeeHive.bundle事先注册时使用
//BH_EXPORT_MODULE(NO)

/**
 组件启动，先执行

 @param context context
 */
- (void)modSetUp:(BHContext *)context
{
//    [[BeeHive shareInstance]  registerService:@protocol(RootServiceProtocol) service:[RootViewController class]];
    
    NSLog(@"RootModule setup");
}

-(void)modInit:(BHContext *)context
{
//    id<RootServiceProtocol> rootVC = [[BeeHive shareInstance] createService:@protocol(RootServiceProtocol)];
//    rootVC.moduleAName=@"BeeHive";
    
    switch (context.env) {
            case BHEnvironmentDev:
            //....初始化开发环境
            break;
            case BHEnvironmentProd:
            //....初始化生产环境
        default:
            break;
    }
    NSLog(@"RootModule init");
}
@end
