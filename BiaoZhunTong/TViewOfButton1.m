//
//  TViewOfButton1.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/25.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TViewOfButton1.h"


#define Screen_W    [UIScreen mainScreen].bounds.size.width
#define Screen_H    [UIScreen mainScreen].bounds.size.height

@interface TViewOfButton1()


@end
@implementation TViewOfButton1


-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createFourButton];
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = delegate ;
    }
    return self ;
}

-(void)createFourButton
{
    NSArray *titles = @[@"my catalog",@"my library",@"industry dynamics",@"Mandatory provisions"];
    NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor yellowColor]];
    CGFloat width = Screen_W/2-7.5 ;
    for (int i = 0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(5+(width+5)*(i%2),55*(i/2), width, 50);
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.backgroundColor = colors[i];
        btn.tag = i+1 ;
        [self addSubview:btn];        
    }
}
-(void)click:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(button:clickOfIndex:)]) {
        [self.delegate button:btn clickOfIndex:btn.tag];
    }
}
@end
