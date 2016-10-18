//
//  LWMediator.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWMediator.h"
#import "LWProtocolManager.h"

static NSString *const APP_SCHEME = @"AloesLu";

@implementation LWMediator

+ (instancetype)sharedInstance{
    static LWMediator *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

+ (id)performActionWithUrl:(NSURL *)url callBack:(void (^)(BOOL, id))callBack{
    
//    对Url的格式进行审核，可以按需求进行拦截
    if (![url.scheme isEqualToString:APP_SCHEME]) {
        if (callBack) {
            callBack(NO,nil);
        }
        return nil;
    }
    
//    对Url携带的参数进行获取
    NSMutableArray *params = [[NSMutableArray alloc]init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elements = [param componentsSeparatedByString:@"="];
        if (elements.count<2) {
            [params addObject:[NSNull null]];
        } else {
            [params addObject:[elements lastObject]];
        }
    }
    
//    对交互操作名进行审核
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        if (callBack) {
            callBack(NO,nil);
        }
        return nil;
    }
    
//    执行交互操作
    id rs = [self performSelector:NSSelectorFromString(actionName) withObjects:params failure:^{
        NSLog(@"LWMediator 所有Category中不存在 %@ 方法",actionName);
    }];
    return rs;
}

+(id)performModuleProtocol:(NSString *)protocolName actionName:(NSString *)actionName params:(NSArray *)params callBack:(void (^)(BOOL, id))callBack{
    
//    获取协议，类实例，交互方法
    id protocol = NSProtocolFromString(protocolName);
    id implClassInstance = [[LWProtocolManager sharedManager] createInstanceFromProtocol:protocol];
    SEL action = NSSelectorFromString(actionName);
    
//    类实例不存在，则直接返回
    if(implClassInstance == nil){
        if (callBack ){
            callBack(NO, nil);
        }
        return nil;
    }
    
//    如果类实例存在交互方法，则执行方法。不存在，则按需要进行处理。
    if([implClassInstance respondsToSelector:action]){
        id returnVal = [implClassInstance performSelector:action withObjects:params];
        if (callBack) {
            callBack(YES, returnVal);
        }
    }else{
        SEL action = NSSelectorFromString(@"notFound:");
        if ([implClassInstance respondsToSelector:action]) {
            [implClassInstance performSelector:action withObjects:params];
        } else {

        }
        if (callBack) {
            callBack(NO, nil);
        }
    }
    return implClassInstance;
}

#pragma mark 执行交互方法
/**
 执行交互方法的类方法

 @param selector 方法
 @param objects  参数
 @param failure  错误block

 @return 返回值
 */
+ (id)performSelector:(SEL)selector withObjects:(NSArray *)objects failure:(void(^)())failure
{
//    方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] methodSignatureForSelector:selector];
    if (signature == nil) {
        if (failure) {
            failure();
        }
        return nil;
    }
    
//    NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
//    设置参数，除self、_cmd以外的参数个数（-2）
    NSInteger paramsCount = signature.numberOfArguments - 2;
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
//    调用执行方法
    [invocation invoke];
    
//    获取返回值，有返回值类型，才去获得返回值
    id returnValue = nil;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    return returnValue;
}

/**
 执行交互方法的实例方法

 @param selector 方法
 @param objects  参数

 @return 返回值
 */
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {

    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    NSInteger paramsCount = signature.numberOfArguments - 2;
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }

    [invocation invoke];
    
    id returnValue = nil;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}
@end
