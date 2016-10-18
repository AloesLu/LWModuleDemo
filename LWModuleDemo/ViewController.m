//
//  ViewController.m
//  LWModuleDemo
//
//  Created by AloesLu on 2016/10/18.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "ViewController.h"
#import "LWMediator+ModuleA.h"
#import "LWMediator+ModuleB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *buttonA=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    buttonA.backgroundColor=[UIColor redColor];
    [buttonA setTitle:@"ModuleA" forState:UIControlStateNormal];
    [buttonA setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonA addTarget:self action:@selector(buttonAAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonB=[[UIButton alloc]initWithFrame:CGRectMake(100, 220, 100, 100)];
    buttonB.backgroundColor=[UIColor redColor];
    [buttonB setTitle:@"ModuleB" forState:UIControlStateNormal];
    [buttonB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonB addTarget:self action:@selector(buttonBAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonA];
    [self.view addSubview:buttonB];
}

- (void)buttonAAction:(id)sender{
//    UIViewController *vc=[LWMediator protocolGoToModuleA:@"AAAAAA"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    NSString *urlStr = @"AloesLu://ModuleA/urlGoToModuleA:?moduleAName=111111";
    NSURL *url = [NSURL URLWithString:urlStr];
    [LWMediator performActionWithUrl:url callBack:NULL];
}

- (void)buttonBAction:(id)sender{
//    UIViewController *vc=[LWMediator protocolGoToModuleB:@"BBBBBB"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    NSString *urlStr = @"AloesLu://ModuleB/urlGoToModuleB:?moduleBTitle=222222";
    NSURL *url = [NSURL URLWithString:urlStr];
    UIViewController *vc1 = [LWMediator performActionWithUrl:url callBack:NULL];
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
