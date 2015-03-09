//
//  ShowCurrentDate.m
//  SecurityCenter
//
//  Created by kt on 15/3/9.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "ShowCurrentDateView.h"

@implementation ShowCurrentDateView {
    NSString *currentTime;
    NSTimer *timer;
}

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setLocale:[NSLocale currentLocale]];
        [outputFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
        currentTime = [outputFormatter stringFromDate:[NSDate date]];
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)updateTime {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    currentTime = [outputFormatter stringFromDate:[NSDate date]];
    [self setNeedsDisplay];
}

- (void)startUpdate {
    [timer fire];
}

- (void)stopUpdate {
    [timer invalidate];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*写文字*/
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:24.0];//设置
    [currentTime drawInRect:CGRectMake(20, rect.size.height/6, rect.size.width, rect.size.height/3*2) withFont:font];
    NSLog(@"%@",currentTime);
}


@end
