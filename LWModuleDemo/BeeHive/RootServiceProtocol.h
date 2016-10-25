//
//  RootServiceProtocol.h
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/24.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BeeHive/BHServiceProtocol.h>

@protocol RootServiceProtocol <NSObject, BHServiceProtocol>

@property (nonatomic, copy)NSString *moduleAName;
@end
