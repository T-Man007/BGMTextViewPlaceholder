//
//  ViewController.m
//  Buddhism
//
//  Created by ZhaoBin Li on 2018/2/24.
//  Copyright © 2018年 ZhaoBin Li. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UITextView+LZBExtention.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];
}


- (void)setupTextView
{
    UITextView *textView = [[UITextView alloc] init];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(168);
    }];
    textView.font = [UIFont systemFontOfSize:13];
    textView.layer.borderWidth = 1.0;
    textView.layer.cornerRadius = 10.0;
//    //用runtime动态添加属性方法设置占位文字，由于setText:可为nil,所以重写此方法后无法正常赋值，方法如果要立马设置text则需先设置text，再设置占位文，占位文字和text会同时显示出来。
//    textView.text = @"123";
    [textView setFont:[UIFont systemFontOfSize:20]];
    textView.bgm_placeholderFont = [UIFont systemFontOfSize:20];
    textView.bgm_placeholderColor = [UIColor grayColor];
    textView.bgm_placeholder = @"一切皆为虚幻...";
    
//    [textView setPlaceholderColor:[UIColor purpleColor] fontSize:18.0 placeholder:@"一切皆为虚幻..."];
//    //用KVC方法，如果要立马设置text则需在设置完占位文字后再设置，不然把text删除后占位文字不会出现
//    textView.text = @"123";

}



@end
