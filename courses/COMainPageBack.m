//
//  COMainPageBack.m
//  courses
//
//  Created by leave on 14-6-27.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COMainPageBack.h"

@implementation COMainPageBack

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetShouldAntialias(context, NO);
    [[UIColor colorWithWhite:227.f/255.f alpha:1]setStroke];
    
    CGPoint top1 = CGPointMake(60, 0);
    CGPoint top2 = CGPointMake(190, 0);
    CGPoint down1 = CGPointMake(60, rect.size.height);
    CGPoint down2 = CGPointMake(190, rect.size.height);
    [self drawLineFrom:top1 to:down1 inContext:context];
    [self drawLineFrom:top2 to:down2 inContext:context];
    
    // horizantal line

}

-(void)drawLineFrom:(CGPoint)a to:(CGPoint)b inContext:(CGContextRef)context
{
    CGPoint aPoints[2] = {a,b};//坐标点
    CGContextAddLines(context, aPoints, 2); // 添加线
    CGContextDrawPath(context, kCGPathStroke); // 根据坐标绘制路径
}


@end
