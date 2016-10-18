//
//  LWMediator.h
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWMediator : NSObject

/**
 单例对象实例化

 @return 单例对象
 */
+ (instancetype)sharedInstance;

/**
 通过《Url》进行跨组件交互

 @param url      交互Url
 @param callBack 是否成功回调

 @return 对应交互方法的返回值
 */
+ (id)performActionWithUrl:(NSURL *)url callBack:(void(^)(BOOL isExcSucc, id returnVal))callBack;

/**
 通过《协议》进行跨组件交互

 @param protocolName 协议名称
 @param actionName   交互事件名称
 @param params       交互事件参数
 @param callBack     是否成功回调

 @return 对应交互方法的返回值
 */
+ (id)performModuleProtocol:(NSString *)protocolName actionName:(NSString *)actionName params:(NSArray *)params callBack:(void(^)(BOOL isExcSucc, id returnVal))callBack;

@end
