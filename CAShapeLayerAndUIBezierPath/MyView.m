
//
//  MyView.m
//  CAShapeLayerAndUIBezierPath
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 何万牡. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    [self simpleDraw];
    
//    [self drawARCPath];
    
//    [self drawTrianglePath];
    
//    [self drawSecondBezierPath];
    
}
//圆角矩形
-(void)simpleDraw
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 100, 100) cornerRadius:20];
    path.lineWidth = 5;
    
    //设置填充颜色
    UIColor * fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    //设置线的颜色，需要在填充颜色之后设置
    UIColor * lineColor = [UIColor redColor];
    [lineColor set];
    [path stroke];
}

//画圆弧
-(void)drawARCPath
{
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(20, 150) radius:100 startAngle:0 endAngle:M_PI*90/180 clockwise:YES];
    
    //连接处的样式
    path.lineCapStyle = kCGLineCapRound;
    
    //连接方式
    path.lineJoinStyle = kCGLineCapRound;
    path.lineWidth = 5.0f;
    
    UIColor * lineColor = [UIColor redColor];
    [lineColor set];
    [path stroke];
}

//画三角形
-(void)drawTrianglePath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置起点
    [path moveToPoint:CGPointMake(20, 300)];
    [path addLineToPoint:CGPointMake(150, 400)];
    [path addLineToPoint:CGPointMake(20, 400)];
    
    [path closePath];
    
    path.lineWidth = 5.0f;
    
    UIColor * fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    UIColor * lineColor = [UIColor redColor];
    [lineColor set];
    [path stroke];
    
}

//画二次贝塞尔曲线
-(void)drawSecondBezierPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(200, 150)];
    [path addQuadCurveToPoint:CGPointMake(200, 300) controlPoint:CGPointMake(50, 50)];
    [path addQuadCurveToPoint:CGPointMake(100, 400) controlPoint:CGPointMake(200, 200)];
    path.lineWidth = 5;
    
    UIColor * lineColor = [UIColor redColor];
    [lineColor set];
    [path stroke];
}










@end
