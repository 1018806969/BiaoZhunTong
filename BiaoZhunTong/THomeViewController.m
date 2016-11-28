//
//  THomeViewController.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/25.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "THomeViewController.h"
#import "TViewOfButton1.h"
#import "TViewOfButton2.h"
#import "TTableOrderView.h"

#define Screen_W    [UIScreen mainScreen].bounds.size.width
#define Screen_H    [UIScreen mainScreen].bounds.size.height



@interface THomeViewController ()<UIScrollViewDelegate,TViewOfButton1Delegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIScrollView    *bgScrollView;
@property(nonatomic,strong)UIScrollView    *adScrollView;
@property(nonatomic,strong)UIButton        *seachButton;
@property(nonatomic,strong)UIButton        *bellButton;
@property(nonatomic,strong)UIImageView     *barImageView;
@property(nonatomic,strong)UITableView     *tableView;

@property(nonatomic,strong)TViewOfButton1  *fourView;
@property(nonatomic,strong)TViewOfButton2  *fiveView;
@property(nonatomic,strong)TTableOrderView *orderView;


@end

@implementation THomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"===--==%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));
    [self.view addSubview:self.bgScrollView];
    [self.view addSubview:self.orderView];
    [self originalTarBar];
    
}
#pragma mark-------------------delegate----------------------
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _bgScrollView) {
        CGFloat maxAlphaOffset = 36.5 ;
        CGFloat alpha = scrollView.contentOffset.y/maxAlphaOffset;
        _barImageView.alpha = alpha ;
        _barImageView.backgroundColor = [UIColor blueColor];
        NSLog(@"%@===%f",scrollView,scrollView.contentOffset.y) ;
        if (scrollView.contentOffset.y > 250.0) {
            _orderView.hidden = NO ;
        }else
        {
            _orderView.hidden = YES ;
        }
    }
}
-(void)button:(UIButton *)button clickOfIndex:(NSUInteger)index
{
    NSLog(@"click %@,tag is %lu",button.titleLabel.text,(unsigned long)index);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  30 ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40 ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuser_id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuser_id];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuser_id];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.section,(long)indexPath.row];
    return cell ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click cell %ld-%ld",(long)indexPath.row,(long)indexPath.section);
}
#pragma mark--------------------private respose--------------
-(void)searchClick
{
    NSLog(@"search");
}
-(void)bellClick
{
    NSLog(@"bell");
}
#pragma mark-----------------------init &setting & getting-------------
-(void)originalTarBar
{
    self.automaticallyAdjustsScrollViewInsets = NO ;

    self.navigationItem.titleView = self.seachButton;
    
    _barImageView = self.navigationController.navigationBar.subviews.firstObject;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
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
        _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H-49)];
        _bgScrollView.backgroundColor = [UIColor grayColor];
        _bgScrollView.delegate = self ;
        _bgScrollView.contentSize = CGSizeMake(Screen_W, 1515);
        [_bgScrollView addSubview:self.adScrollView];
        [_bgScrollView addSubview:self.fourView];
        [_bgScrollView addSubview:self.fiveView];
        [_bgScrollView addSubview:self.tableView];
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
-(TViewOfButton1 *)fourView
{
    if (!_fourView) {
        _fourView = [[TViewOfButton1 alloc]initWithFrame:CGRectMake(0, 110, Screen_W, 105) delegate:self];
    }
    return _fourView;
}
-(TViewOfButton2 *)fiveView
{
    if (!_fiveView) {
        _fiveView = [[TViewOfButton2 alloc]initWithFrame:CGRectMake(0,230, Screen_W, 70)];
        _fiveView.clickButton = ^(UIButton *btn,NSUInteger index){
            NSLog(@"2_btn=%@,index=%lu",btn.titleLabel.text,(unsigned long)index);
        };
    }
    return _fiveView;
}
-(TTableOrderView *)orderView
{
    if (!_orderView) {
        _orderView = [[TTableOrderView alloc]initWithFrame:CGRectMake(0, 64, Screen_W,44)];
        _orderView.backgroundColor = [UIColor redColor];
        _orderView.hidden = YES ;
    }
    return _orderView ;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 315, Screen_W,1200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self ;
        _tableView.scrollEnabled = NO;
        TTableOrderView * orderV = [[TTableOrderView alloc]initWithFrame:CGRectMake(0, 0, Screen_W,44)];
        orderV.backgroundColor = [UIColor redColor];

        _tableView.tableHeaderView = orderV;
    }
    return _tableView ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
