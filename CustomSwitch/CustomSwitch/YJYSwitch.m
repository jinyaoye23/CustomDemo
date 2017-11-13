//
//  YJYSwitch.m
//  CustomSwitch
//
//  Created by Yao on 2017/11/13.
//  Copyright © 2017年 叶进耀. All rights reserved.
//

#import "YJYSwitch.h"

#define YJYSwitchMaxHeight 80.0f
#define YJYSwitchMinHeight 20.0f

#define YJYSwitchMinWidth 40.0f


@interface YJYSwitch ()

@property (nonatomic, strong) UIView      *containerView;
@property (nonatomic, strong) UIView      *onContentView;
@property (nonatomic, strong) UIView      *offContentView;
@property (nonatomic, strong) UIColor     *onColor;
@property (nonatomic, strong) UIColor     *offColor;
@property (nonatomic, assign) NSInteger   ballSize;
@property (nonatomic, strong) UIFont      *font;
@property (nonatomic, strong) UIView      *knobView;
@property (nonatomic, strong) UILabel     *onLabel;
@property (nonatomic, strong) UILabel     *offLabel;

-(void)commonInit;
-(CGRect)roundRect:(CGRect)frameOrBounds;
-(void)handleTapGesgtureRecognizerEvent:(UITapGestureRecognizer *)recognizer;
-(void)handlePanGesgtureRecognizerEvent:(UIPanGestureRecognizer *)recognizer;

@end


@implementation YJYSwitch

-(instancetype)initWithFrame:(CGRect)frame onColor:(UIColor *)onColor offColor:(UIColor *)offColor font:(UIFont *)font ballSize:(NSInteger)ballSize{
    
    self = [super initWithFrame:[self roundRect:frame]];
    if (self) {
        self.ballSize = ballSize;
        self.font = font;
        self.onColor = onColor;
        self.offColor = offColor;
        self.textColor = [UIColor whiteColor];
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)setBounds:(CGRect)bounds{
    [super setBounds:[self roundRect:bounds]];
    [self setNeedsLayout];
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:[self roundRect:frame]];
    [self setNeedsLayout];
    
}
-(void)setOnText:(NSString *)onText{
    if (_onText != onText) {
        _onText = onText;
        _onLabel.text = onText;
    }
}
-(void)setOffText:(NSString *)offText{
    if (_offText != offText) {
        _offText = offText;
        _offLabel.text = offText;
    }
}
-(void)setOnTintColor:(UIColor *)onTintColor{
    if (_onTintColor != onTintColor) {
        _onTintColor = onTintColor;
        _onContentView.backgroundColor = onTintColor;
        self.onColor = onTintColor;
        if (self.isOn) {
            _knobView.layer.borderColor = onTintColor.CGColor;
        }
    }
}
-(void)setThumbTintColor:(UIColor *)thumbTintColor{
    if (_thumbTintColor != thumbTintColor) {
        _thumbTintColor = thumbTintColor;
        _offContentView.backgroundColor = thumbTintColor;
        _knobView.layer.borderColor = thumbTintColor.CGColor;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.containerView.frame = self.bounds;
    CGFloat r = CGRectGetHeight(self.containerView.bounds) / 2.0;
    self.containerView.layer.cornerRadius = r;
    self.containerView.layer.masksToBounds = YES;
    
    CGFloat margin = (CGRectGetHeight(self.bounds) - self.ballSize) / 2.0;
    
    CGFloat width = CGRectGetWidth(self.containerView.bounds);
    CGFloat height = CGRectGetHeight(self.containerView.bounds);
    
    if (self.isOn) {
        [UIView animateWithDuration:0.25 animations:^{
            self.onContentView.frame = CGRectMake(0, 0, width, height);
            self.offContentView.frame = CGRectMake(width, 0, width, height);
            self.knobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds)-margin-self.ballSize, margin, self.ballSize, self.ballSize);
            
        } completion:^(BOOL finished) {
            
            _knobView.layer.borderColor = self.onColor.CGColor;
            _knobView.layer.shadowOffset = CGSizeMake(-2, 0);
        }];
        
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.onContentView.frame = CGRectMake(-width, 0, width, height);
            self.offContentView.frame = CGRectMake(0, 0, width, height);
            self.knobView.frame = CGRectMake(margin, margin, self.ballSize, self.ballSize);
        } completion:^(BOOL finished) {
            self.knobView.layer.borderColor = self.offColor.CGColor;
            self.knobView.layer.shadowOffset = CGSizeMake(2, 0);
            
        }];
    }
    
    [self.onLabel sizeToFit];
    [self.offLabel sizeToFit];
    
    CGSize onLabelSize = self.onLabel.bounds.size;
    CGSize offLabelSize = self.offLabel.bounds.size;
    
    self.onLabel.frame = CGRectMake(r/2, (height-onLabelSize.height)/2, onLabelSize.width, onLabelSize.height);
    self.offLabel.frame = CGRectMake(width-r/2-offLabelSize.width, (height-offLabelSize.height)/2, offLabelSize.width, offLabelSize.height);
    
    
    
    
    
}

-(void)setOn:(BOOL)on{
    [self setOn:on animated:NO];
}
-(void)setOn:(BOOL)on animated:(BOOL)animated{
    if (_on == on) {
        return;
    }
    _on = on;
    CGFloat margin = (CGRectGetHeight(self.bounds) - self.ballSize) / 2.0;
    CGFloat width = CGRectGetWidth(self.containerView.bounds);
    CGFloat height = CGRectGetHeight(self.containerView.bounds);
    
    if (self.isOn) {
        [UIView animateWithDuration:0.25 animations:^{
            self.onContentView.frame = CGRectMake(0, 0, width, height);
            self.offContentView.frame = CGRectMake(width, 0, width, height);
            self.knobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds)-margin-self.ballSize, margin, self.ballSize, self.ballSize);
            
            _knobView.layer.borderColor = self.onColor.CGColor;
            _knobView.layer.shadowOffset = CGSizeMake(-2, 0);
        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.onContentView.frame = CGRectMake(-1*width, 0, width, height);
            self.offContentView.frame = CGRectMake(0, 0, width, height);
            self.knobView.frame = CGRectMake(margin, margin, self.ballSize, self.ballSize);
            self.knobView.layer.borderColor = self.offColor.CGColor;
            self.knobView.layer.shadowOffset = CGSizeMake(2, 0);
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(void)commonInit{
    self.backgroundColor = [UIColor clearColor];
    _onTintColor = self.onColor;
    _tintColor = self.offColor;
    _thumbTintColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    _textFont = self.font;
    _textColor = self.textColor;
    
    _containerView = [[UIView alloc]initWithFrame:self.bounds];
    _containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_containerView];
    
    _onContentView = [[UIView alloc]initWithFrame:self.bounds];
    _onContentView.backgroundColor = self.onColor;
    [_containerView addSubview:_onContentView];
    
    _offContentView = [[UIView alloc]initWithFrame:self.bounds];
    _offContentView.backgroundColor = self.offColor;
    [_containerView addSubview:_offContentView];
    
    _knobView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.ballSize, self.ballSize)];
    _knobView.backgroundColor = _thumbTintColor;
    _knobView.layer.cornerRadius = self.ballSize / 2;
    _knobView.layer.borderWidth = 5;
    _knobView.layer.borderColor = self.offColor.CGColor;
    _knobView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _knobView.layer.shadowOffset = CGSizeMake(2, 0);
    _knobView.layer.shadowRadius = 0.5;
    _knobView.layer.shadowOpacity = 0.1;
    [self addSubview:_knobView];
    
    _onLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _onLabel.backgroundColor = [UIColor clearColor];
    _onLabel.textAlignment = NSTextAlignmentCenter;
    _onLabel.textColor = _textColor;
    _onLabel.font = _font;
    _onLabel.text = _onText;
    [_onContentView addSubview:_onLabel];
    
    _offLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _offLabel.backgroundColor = [UIColor clearColor];
    _offLabel.textAlignment = NSTextAlignmentCenter;
    _offLabel.textColor = _textColor;
    _offLabel.font = _font;
    _offLabel.text = _offText;
    [_offContentView addSubview:_offLabel];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesgtureRecognizerEvent:)];
    [self addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesgtureRecognizerEvent:)];
    [self addGestureRecognizer:panGesture];
    
}

-(CGRect)roundRect:(CGRect)frameOrBounds{
    CGRect newRect = frameOrBounds;
    if (newRect.size.height > YJYSwitchMaxHeight) {
        newRect.size.height = YJYSwitchMaxHeight;
    }
    if (newRect.size.height < YJYSwitchMinHeight) {
        newRect.size.height = YJYSwitchMinHeight;
    }
    if (newRect.size.width < YJYSwitchMinWidth) {
        newRect.size.width = YJYSwitchMinWidth;
    }
    return newRect;
}

-(void)handleTapGesgtureRecognizerEvent:(UITapGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self setOn:!self.isOn animated:YES];
        if (self.actionBlock) {
            self.actionBlock(self.isOn);
        }
    }
}

-(void)handlePanGesgtureRecognizerEvent:(UIPanGestureRecognizer *)recognizer{
    
}


@end
