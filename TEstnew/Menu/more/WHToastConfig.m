//
//  WHToastConfig.m
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import "WHToastConfig.h"

static CGFloat toast_padding = 10;
static CGFloat toast_tipImageWidth = 20;
static CGFloat toast_cornerRadius = 7;
static CGFloat toast_fontSize = 15;
static CGFloat toast_imageCornerRadius = 0;

@implementation WHToastConfig

static id _instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self resetConfig];
    }
    return self;
}
//色
- (void)resetConfig {
    _showMask = YES;
    _maskCoverNav = YES;
    //背景
    _maskColor = [UIColor colorWithWhite:0 alpha:0.0];
    _iconColor = [UIColor whiteColor];
    //文字
    _textColor = [UIColor colorWithRed: 1.00 green: 0.12 blue: 0.08 alpha: 1.00];
    //提示框
    _backColor = [UIColor blackColor];
    _padding = toast_padding;
    _fontSize = toast_fontSize;
    _cornerRadius = toast_cornerRadius;
    _imageCornerRadius = toast_imageCornerRadius;
    _minWidth = kWHToastScreenWidth / 2.5;
    _tipImageSize = CGSizeMake(toast_tipImageWidth, toast_tipImageWidth);
}

@end
