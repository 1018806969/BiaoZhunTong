//
//  TViewOfButton2.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/26.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TViewOfButton2.h"

#define Screen_W    [UIScreen mainScreen].bounds.size.width
#define Screen_H    [UIScreen mainScreen].bounds.size.height

@implementation TViewOfButton2

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createFourButton];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self ;
}
-(void)createFourButton
{
    NSArray *titles = @[@"contry",@"industy",@"location",@"comny",@"other"];
    CGFloat width = Screen_W/5 ;
    for (int i = 0; i<5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width*(i%5),0, width, 70);
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.tag = i+1 ;
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:btn];
    }
}
-(void)click:(UIButton *)btn
{
    _clickButton(btn,btn.tag);
}
@end
