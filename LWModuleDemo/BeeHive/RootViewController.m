//
//  RootViewController.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/24.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "RootViewController.h"
#import <BeeHive/BeeHive.h>
#import "RootServiceProtocol.h"

@interface RootViewController ()<RootServiceProtocol>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.moduleAName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
