//
//  LWMediator+ModuleB.h
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWMediator.h"
#import <UIKit/UIKit.h>

@interface LWMediator (ModuleB)
+ (UIViewController *)protocolGoToModuleB:(NSString*)moduleBTitle;
@end
