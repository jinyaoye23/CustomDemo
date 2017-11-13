//
//  YJYSwitch.h
//  CustomSwitch
//
//  Created by Yao on 2017/11/13.
//  Copyright © 2017年 叶进耀. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(BOOL isOn);

@interface YJYSwitch : UIControl

@property (nonatomic, assign, getter=isOn) BOOL on;

@property (nonatomic, strong) UIColor    *onTintColor;
@property (nonatomic, strong) UIColor    *tintColor;
@property (nonatomic, strong) UIColor    *thumbTintColor;
@property (nonatomic, assign) NSInteger  switchKnobSize;
@property (nonatomic, strong) UIColor    *textColor;
@property (nonatomic, strong) UIFont     *textFont;

@property (nonatomic, strong) NSString   *onText;
@property (nonatomic, strong) NSString   *offText;

@property (nonatomic, copy)  ActionBlock actionBlock;

-(void)setOn:(BOOL)on animated:(BOOL)animated;

-(instancetype)initWithFrame:(CGRect)frame onColor:(UIColor *)onColor offColor:(UIColor *)offColor font:(UIFont *)font ballSize:(NSInteger)ballSize;


@end
