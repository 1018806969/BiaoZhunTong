//
//  TViewOfButton2.h
//  BiaoZhunTong
//
//  Created by txx on 16/11/26.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TViewOfButton2 : UIView

typedef void(^clickButton)(UIButton *btn,NSUInteger index);

@property(nonatomic,strong)clickButton clickButton;

-(instancetype)initWithFrame:(CGRect)frame;



@end
