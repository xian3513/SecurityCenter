//
//  CircleView.m
//  SecurityCenter
//
//  Created by kt on 15/3/9.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "CircleView.h"
const CGFloat circleTimes = 300;
@implementation CircleView {
   
    CGFloat x;
    CGFloat y;
    CGFloat radius;
    CGFloat startAngle;
    CGFloat startAngleTemp;
    CGFloat intervalAngle;
    NSTimer *timer;
    CGFloat flag;
}

- (id)initWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end time:(CGFloat)time {
    if(self = [super initWithFrame:frame]) {
        flag = 0;
        x = 150;
        y = 250;
        radius = 90;
        startAngle = start;
        startAngleTemp = start;
        intervalAngle = (end-start)/circleTimes;
        timer = [NSTimer scheduledTimerWithTimeInterval:time/circleTimes target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}
    return self;
}

- (void)updateProgress {
    NSLog(@"%@ flag:%.2f",NSStringFromSelector(_cmd),flag/circleTimes);
    if(flag++ == circleTimes) {
        self.drawFinish();
        [timer invalidate];
    }
     [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
      CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,0.6,0.1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 5.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    
    CGContextAddArc(context, x, y, radius,startAngleTemp, startAngleTemp+intervalAngle*flag, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
}

@end
