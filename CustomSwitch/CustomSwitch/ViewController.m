//
//  ViewController.m
//  CustomSwitch
//
//  Created by Yao on 2017/11/13.
//  Copyright © 2017年 叶进耀. All rights reserved.
//

#import "ViewController.h"
#import "YJYSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YJYSwitch *switchView = [[YJYSwitch alloc]initWithFrame:CGRectMake(100, 100, 60, 25) onColor:[UIColor orangeColor] offColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:17] ballSize:30];
    switchView.onText = @"on";
    switchView.offText = @"off";
    //设置开或者关
    [switchView setOn:YES animated:YES];
    [self.view addSubview:switchView];
    switchView.actionBlock = ^(BOOL isOn){
        NSLog(@"is %@", isOn ? @"YES" : @"NO");
    };
    
    YJYSwitch *switchView2 = [[YJYSwitch alloc]initWithFrame:CGRectMake(100, 150, 80, 30) onColor:[UIColor purpleColor] offColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:17] ballSize:33];
    switchView2.onText = @"on";
    switchView2.offText = @"off";
    [self.view addSubview:switchView2];
    switchView2.actionBlock = ^(BOOL isOn){
        NSLog(@"is %@", isOn ? @"YES" : @"NO");
    };
    
    YJYSwitch *switchView3 = [[YJYSwitch alloc]initWithFrame:CGRectMake(100, 200, 80, 30) onColor:[UIColor brownColor] offColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:17] ballSize:35];
    switchView3.onText = @"on";
    switchView3.offText = @"off";
    [self.view addSubview:switchView3];
    switchView3.actionBlock = ^(BOOL isOn){
        NSLog(@"is %@", isOn ? @"YES" : @"NO");
    };

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
