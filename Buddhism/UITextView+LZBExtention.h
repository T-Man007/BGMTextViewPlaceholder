//
//  UITextView+LZBExtention.h
//  Buddhism
//
//  Created by ZhaoBin Li on 2018/2/24.
//  Copyright © 2018年 ZhaoBin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LZBExtention)

/** 占位文字*/
@property (nonatomic, copy)   NSString *bgm_placeholder;

/** 占位文字颜色*/
@property (nonatomic, strong) UIColor *bgm_placeholderColor;

/** 占位文字字体*/
@property (nonatomic, strong) UIFont  *bgm_placeholderFont;

/** 占位Label*/
@property (nonatomic, strong) UILabel *bgm_placeholderLabel;


/** 设置占位文字 此方法仅支持8.3以上系统*/
- (void)setPlaceholderColor:(UIColor *)color fontSize:(CGFloat)fontSize placeholder:(NSString *)placeholder NS_AVAILABLE_IOS(8_3);



@end
