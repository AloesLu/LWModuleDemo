//
//  ModuleB1ViewController.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "ModuleB1ViewController.h"
#import "LWProtocolManager.h"
#import "ModuleB1ViewControllerProtocol.h"

@interface ModuleB1ViewController ()<ModuleB1ViewControllerProtocol>

@end

@implementation ModuleB1ViewController

LW_REGISTER_CLASS_PROTOCOL(ModuleB1ViewControllerProtocol)

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.moduleBTitle){
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        button.backgroundColor=[UIColor redColor];
        [button setTitle:self.moduleBTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
