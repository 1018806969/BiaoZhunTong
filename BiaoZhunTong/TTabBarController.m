//
//  TTabBarController.m
//  BiaoZhunTong
//
//  Created by txx on 16/11/25.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TTabBarController.h"
#import "TNavigationController.h"
#import "THomeViewController.h"
#import "TPersonalCenterViewController.h"

@interface TTabBarController ()

@end

@implementation TTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    THomeViewController *homeVc = [[THomeViewController alloc]init];
    [self addChildViewController:homeVc title:@"home" imageName:@""];
    
    TPersonalCenterViewController *personalVc = [[TPersonalCenterViewController alloc]init];
    [self addChildViewController:personalVc title:@"personal" imageName:@""];
    
}
-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)name
{
    childController.title = title ;
    childController.tabBarItem.image = [UIImage imageNamed:name];
    TNavigationController *nav = [[TNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
