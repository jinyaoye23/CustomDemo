//
//  ViewController.m
//  ImageAvatarBrowserDemo
//
//  Created by Yao on 2017/11/13.
//  Copyright © 2017年 叶进耀. All rights reserved.
//

#import "ViewController.h"
#import "YJYImageAvatarBrowser.h"

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIImageView *originImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.originImageView];
}

-(UIImageView *)originImageView{
    if (_originImageView == nil) {
        _originImageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, 500, 80, 100)];
        _originImageView.contentMode = UIViewContentModeScaleAspectFill;
        _originImageView.clipsToBounds = YES;
        _originImageView.image = [UIImage imageNamed:@"photo_3.jpg"];
        _originImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap)];
        [_originImageView addGestureRecognizer:tap];
    }
    return _originImageView;
}
-(void)onTap{
    [YJYImageAvatarBrowser showImage:self.originImageView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
