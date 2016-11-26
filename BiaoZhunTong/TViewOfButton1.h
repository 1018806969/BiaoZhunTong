//
//  TViewOfButton1.h
//  BiaoZhunTong
//
//  Created by txx on 16/11/25.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TViewOfButton1 : UIView

@property(nonatomic,assign)id delegate ;


-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;

@end


@protocol TViewOfButton1Delegate <NSObject>

-(void)button:(UIButton *)button clickOfIndex:(NSUInteger)index;

@end
