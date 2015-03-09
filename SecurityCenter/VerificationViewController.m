//
//  VerificationViewController.m
//  SecurityCenter
//
//  Created by kt on 15/3/9.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "VerificationViewController.h"
#import "CircleView.h"
@interface VerificationViewController ()

@end

@implementation VerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) startAngle:-M_PI_2 endAngle:1.5*M_PI time:30];
    [self.view addSubview:circle];
    
    circle.drawFinish = ^(){
        NSLog(@"finish");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
