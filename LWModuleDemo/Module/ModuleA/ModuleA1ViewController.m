//
//  ModuleA1ViewController.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "ModuleA1ViewController.h"
#import "LWProtocolManager.h"
#import "ModuleA1ViewControllerProtocol.h"

@interface ModuleA1ViewController ()<ModuleA1ViewControllerProtocol>

@end

@implementation ModuleA1ViewController

LW_REGISTER_CLASS_PROTOCOL(ModuleA1ViewControllerProtocol)

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.moduleAName){
        self.title=self.moduleAName;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
