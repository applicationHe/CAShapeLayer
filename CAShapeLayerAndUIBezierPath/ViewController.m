//
//  ViewController.m
//  CAShapeLayerAndUIBezierPath
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 何万牡. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
{
    MyView * _myView;
    
    CAShapeLayer * layer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIBezierPath测试
    /*
    _myView = [[MyView alloc] initWithFrame:self.view.bounds];
    _myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myView];
     */
    
    //CAShapeLayer和UIBezierPath画图
    layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 20.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineCapRound;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];

    //创建贝塞尔路径
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    //关联layer和贝塞尔路径
    layer.path = path.CGPath;
    
    //创建Animation
    CABasicAnimation * basicAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAni.fromValue = @(0.0);
    basicAni.toValue = @(1.0);
    layer.autoreverses = NO;
    basicAni.duration = 3.0f;
    
    //设置layer的animation
    [layer addAnimation:basicAni forKey:nil];
    basicAni.delegate = self;

    
    int count = 16;
    for (int i=0; i<count; i++) {
        CAShapeLayer * lineLayer = [CAShapeLayer layer];
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor yellowColor].CGColor;
        lineLayer.lineWidth = 15.0f;
        lineLayer.lineCap = kCALineCapRound;
        lineLayer.lineJoin = kCALineCapRound;
        [self.view.layer addSublayer:lineLayer];
        
        UIBezierPath * path2 = [UIBezierPath bezierPath];
        int x = 200+100*cos(2*M_PI/count*i);
        int y = 200-100*sin(2*M_PI/count*i);
        int len = 50;
        [path2 moveToPoint:CGPointMake(x, y)];
        [path2 addLineToPoint:CGPointMake(x+len*cos(2*M_PI/count*i), y-len*sin(2*M_PI/count*i))];
        lineLayer.path = path2.CGPath;
        [lineLayer addAnimation:basicAni forKey:nil];
    }
    
    
    
}

//动画结束回调
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    layer.fillColor = [UIColor redColor].CGColor;
}


@end
