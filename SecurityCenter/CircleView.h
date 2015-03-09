//
//  CircleView.h
//  SecurityCenter
//
//  Created by kt on 15/3/9.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^drawCircleFinish)();
@interface CircleView : UIView
@property (nonatomic,copy)drawCircleFinish drawFinish;

- (id)initWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end time:(CGFloat)t;
@end
