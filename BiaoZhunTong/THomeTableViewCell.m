//
//  THomeTableViewCell.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/26.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "THomeTableViewCell.h"
#import "Masonry.h"

@implementation THomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imageView1];
        [self.contentView addSubview:self.imageView2];
        [self.contentView addSubview:self.imageView3];
        [self.contentView addSubview:self.imageView4];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.imageView5];

        [self layoutViews];
        
    }
    return  self ;
}
-(void)layoutViews
{
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
        make.height.and.width.mas_equalTo(5);
    }];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.height.and.width.mas_equalTo(5);
    }];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.and.width.mas_equalTo(5);
        make.bottom.mas_equalTo(-15);
    }];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView1.mas_right).mas_offset(10);
        make.centerY.equalTo(_imageView1);
        make.height.mas_equalTo(25);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView2.mas_right).mas_offset(10);
        make.centerY.equalTo(_imageView3);
        make.height.mas_equalTo(25);
    }];
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView3.mas_right).mas_offset(10);
        make.centerY.equalTo(_imageView3);
        make.height.mas_equalTo(25);
    }];
//    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_label3.mas_right).mas_offset(10);
//    }];

}
-(UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.backgroundColor = [UIColor redColor];
    }
    return _imageView1;
}
-(UIImageView *)imageView2
{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.backgroundColor = [UIColor redColor];
    }
    return _imageView2;
}
-(UIImageView *)imageView3
{
    if (!_imageView3) {
        _imageView3 = [[UIImageView alloc]init];
        _imageView3.backgroundColor = [UIColor redColor];
    }
    return _imageView3;
}
-(UIImageView *)imageView4
{
    if (!_imageView4) {
        _imageView4 = [[UIImageView alloc]init];
        _imageView4.backgroundColor = [UIColor redColor];
    }
    return _imageView4;
}
-(UIImageView *)imageView5
{
    if (!_imageView5) {
        _imageView5 = [[UIImageView alloc]init];
        _imageView5.backgroundColor = [UIColor redColor];
    }
    return _imageView5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
