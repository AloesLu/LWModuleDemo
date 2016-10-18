//
//  LWProtocolManager.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWProtocolManager.h"

@interface LWProtocolManager()
@property (nonatomic,strong)NSMutableDictionary<NSString *,NSString *> *allProtocolClass;
@property (nonatomic,strong)NSRecursiveLock *lock;
@end

@implementation LWProtocolManager

+ (instancetype)sharedManager{
    static LWProtocolManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)registerClass:(Class)cls protocol:(Protocol*)protocol {
    
    NSParameterAssert(cls != nil);
    NSParameterAssert(protocol != nil);
    
//    判断注册的类是否实现协议接口
    if (![cls conformsToProtocol:protocol]) {
        NSString *err = [NSString stringWithFormat:@"%@ class does not comply with %@ protocol", NSStringFromClass(cls), NSStringFromProtocol(protocol)];
        assert(err);
    }
    
//    判断协议接口是否已经被实现，已经实现则不在添加到字典数组
    if ([self.allProtocolClass.allKeys containsObject:NSStringFromProtocol(protocol)]) {
        NSString *err = [NSString stringWithFormat:@"%@ protocol has been registed", NSStringFromProtocol(protocol)];
        assert(err);
    }
    
    [self.lock lock];
    [self.allProtocolClass setObject:NSStringFromClass(cls) forKey:NSStringFromProtocol(protocol)];
    [self.lock unlock];
    
}

- (id)createInstanceFromProtocol:(Protocol *)protocol{
    
//    根据协议名从字典取出对应类名，用类名查找到类
    Class targetClass = nil;
    if(protocol){
        NSString *targetClassName = [self.allProtocolClass objectForKey:NSStringFromProtocol(protocol)];
        targetClass=NSClassFromString(targetClassName);
    }
    
//    如果类存在，则实例化该类
    id classInstance = nil;
    if(targetClass){
        classInstance=[[targetClass alloc]init];
    }
    return classInstance;
}

- (NSMutableDictionary<NSString *,NSString *> *)allProtocolClass {
    if (!_allProtocolClass) {
        _allProtocolClass = [NSMutableDictionary dictionary];
    }
    return _allProtocolClass;
}

- (NSRecursiveLock *)lock
{
    if (!_lock) {
        _lock = [[NSRecursiveLock alloc] init];
    }
    return _lock;
}
@end
