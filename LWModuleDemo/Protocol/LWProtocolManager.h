//
//  LWProtocolManager.h
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LW_REGISTER_CLASS_PROTOCOL(ptl) \
+ (void)load { [[LWProtocolManager sharedManager] registerClass:[self class] protocol:@protocol(ptl)]; }

@interface LWProtocolManager : NSObject

/**
 初始化协议管理单例

 @return 单例对象
 */
+ (instancetype)sharedManager;

/**
 对类注册协议,实现协议接口

 @param class    类
 @param protocol 协议名
 */
- (void)registerClass:(Class)class protocol:(Protocol *)protocol;

/**
 根据协议 创建 实现协议接口的类

 @param protocol 协议名

 @return 实现协议接口的类
 */
- (id)createInstanceFromProtocol:(Protocol *)protocol;
@end
