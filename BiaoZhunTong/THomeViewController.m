//
//  THomeViewController.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/25.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "THomeViewController.h"

#define Screen_W    [UIScreen mainScreen].bounds.size.width
#define Screen_H    [UIScreen mainScreen].bounds.size.height



@interface THomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *bgScrollView;
@property(nonatomic,strong)UIScrollView *adScrollView;
@property(nonatomic,strong)UIButton     *seachButton;
@property(nonatomic,strong)UIButton     *bellButton;
@property(nonatomic,strong)UIImageView  *barImageView;

@end

@implementation THomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.bgScrollView];
    [self originalTarBar];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _bgScrollView) {
        CGFloat maxAlphaOffset = 36.5 ;
        CGFloat alpha = scrollView.contentOffset.y/maxAlphaOffset;
        _barImageView.alpha = alpha ;
        _barImageView.backgroundColor = [UIColor blueColor];
        NSLog(@"%@===%f",_barImageView,scrollView.contentOffset.y) ;
    }
}
-(void)searchClick
{
    NSLog(@"search");
}
-(void)bellClick
{
    NSLog(@"bell");
}
-(void)originalTarBar
{
    self.automaticallyAdjustsScrollViewInsets = NO ;

    self.navigationItem.titleView = self.seachButton;
    
    _barImageView = self.navigationController.navigationBar.subviews.firstObject;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.bellButton];
}
-(UIButton *)seachButton
{
    if (!_seachButton) {
        _seachButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _seachButton.frame = CGRectMake(0, 0, 200, 40);
        [_seachButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_seachButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    }
    return _seachButton ;
}
-(UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H)];
        _bgScrollView.backgroundColor = [UIColor grayColor];
        _bgScrollView.delegate = self ;
        _bgScrollView.contentSize = CGSizeMake(Screen_W, 2*Screen_H);
        [_bgScrollView addSubview:self.adScrollView];
    }
    return _bgScrollView;
}
-(UIScrollView *)adScrollView
{
    if (!_adScrollView) {
        _adScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_W, 100)];
        _adScrollView.backgroundColor = [UIColor orangeColor];
        _adScrollView.contentSize = CGSizeMake(3*Screen_W, 100);
        _adScrollView.pagingEnabled = YES ;
    }
    return _adScrollView;
}
-(UIButton *)bellButton
{
    if (!_bellButton) {
        _bellButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bellButton.frame = CGRectMake(0, 0, 40, 40);
        [_bellButton setImage:[UIImage imageNamed:@"bell"] forState:UIControlStateNormal];;
        [_bellButton addTarget:self action:@selector(bellClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bellButton ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
