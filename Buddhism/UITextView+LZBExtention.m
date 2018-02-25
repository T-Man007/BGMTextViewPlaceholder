//
//  UITextView+LZBExtention.m
//  Buddhism
//
//  Created by ZhaoBin Li on 2018/2/24.
//  Copyright © 2018年 ZhaoBin Li. All rights reserved.
//

#import "UITextView+LZBExtention.h"
#import <objc/runtime.h>
#import "Masonry.h"

static const char *bgm_placeholderLabelKey = "bgm_placeholderLabelKey";
static const char *bgm_placeholdertextKey  = "bgm_placeholdertextKey";


@implementation UITextView (LZBExtention)

- (void)bgm_placehoderTextChange:(NSNotification *)notification {
    if (self.text.length > 0) {
        self.bgm_placeholderLabel.text = @"";
    } else {
        self.bgm_placeholderLabel.text = self.bgm_placeholder;
    }
}

- (void)setBgm_placeholder:(NSString *)bgm_placeholder
{
    if (bgm_placeholder.length == 0) {
        objc_setAssociatedObject(self, bgm_placeholderLabelKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return;
    }

    objc_setAssociatedObject(self,
                             bgm_placeholdertextKey,
                             bgm_placeholder,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);

    if (bgm_placeholder.length == 0 || self.text.length != 0) {
        self.bgm_placeholderLabel.text = @"";
    } else {
        self.bgm_placeholderLabel.text = bgm_placeholder;
    }
    
}

- (NSString *)bgm_placeholder {
    return objc_getAssociatedObject(self, bgm_placeholdertextKey);
}


- (UILabel *)bgm_placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, bgm_placeholderLabelKey);
    if (label == nil || ![label isKindOfClass:[UILabel class]]) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = self.font;
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor purpleColor];
        label.text = self.bgm_placeholder;
        self.bgm_placeholderLabel = label;
        [self addSubview:label];
        __weak typeof(self) weakS = self;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(weakS).insets(UIEdgeInsetsMake(7.5, 5, 0, 0));
        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bgm_placehoderTextChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return label;
}

-(void)setBgm_placeholderLabel:(UILabel *)bgm_placeholderLabel
{
    objc_setAssociatedObject(self, bgm_placeholderLabelKey, bgm_placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void)setBgm_placeholderColor:(UIColor *)bgm_placeholderColor
{
    if (self.bgm_placeholder.length == 0) {//防止placeLabel没有创建而导致赋值无效
        self.bgm_placeholder = @" ";
    }
    self.bgm_placeholderLabel.textColor = bgm_placeholderColor;
}

-(UIColor *)bgm_placeholderColor
{
    return self.bgm_placeholderLabel.textColor;
}

-(void)setBgm_placeholderFont:(UIFont *)bgm_placeholderFont
{
    if (self.bgm_placeholder.length == 0) {//防止placeLabel没有创建而导致赋值无效
        self.bgm_placeholder = @" ";
    }
    self.bgm_placeholderLabel.font = bgm_placeholderFont;
}

-(UIFont *)bgm_placeholderFont
{
    return self.bgm_placeholderLabel.font;
}



#pragma mark - KVC方式
-(void)setPlaceholderColor:(UIColor *)color fontSize:(CGFloat)fontSize placeholder:(NSString *)placeholder
{
    if (self.text.length > 0) {
        return;
    }
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.textAlignment = NSTextAlignmentLeft;
    placeholderLabel.numberOfLines = 0;
    placeholderLabel.textColor = color;
    placeholderLabel.text = [NSString stringWithFormat:@"%@", placeholder];
    placeholderLabel.font =[UIFont systemFontOfSize:fontSize];
    [placeholderLabel sizeToFit];
    [self addSubview:placeholderLabel];

    //利用KVC赋值
    [self setValue:placeholderLabel forKey:@"_placeholderLabel"];
}

@end
