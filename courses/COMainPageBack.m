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
        [self commentInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commentInit];
    }
    return self;
}

-(CGFloat)courseWidth
{
    return self.tomorrowX - self.todayX;
}


-(void)commentInit
{
    [super awakeFromNib];
    // background color
    
    if (!self.startY) {
        self.startY = 35;
    }
    if (!self.startX) {
        self.startX = 40;
    }
    if (!self.tomorrowX) {
        self.tomorrowX = 190;
    }
    if (!self.todayX){
        self.todayX = 60;
    }
    self.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.95 alpha:1];
}

-(void)loadTimeLabels
{
    CGFloat height = 20;
    CGFloat y = self.startY - height/2;
    CGRect frame = CGRectMake(0, y, 50, height);
    int startHour = 6;
    while (frame.origin.y <self.bounds.size.height) {
        UILabel *hourLabel = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:hourLabel];
        hourLabel.textAlignment = NSTextAlignmentCenter;
        hourLabel.textColor = [UIColor colorWithWhite:0.55 alpha:1];
        if (startHour == 7) {
            hourLabel.text = @"AM";
            hourLabel.font = [UIFont systemFontOfSize:15];
        }else if (startHour <= 12){
            hourLabel.font = [UIFont systemFontOfSize:21];
            hourLabel.text = [NSString stringWithFormat:@"%d",startHour];
        }else if (startHour == 13){
            hourLabel.font = [UIFont systemFontOfSize:15];
            hourLabel.text = @"PM";
        }else if (startHour < 23){
            hourLabel.font = [UIFont systemFontOfSize:21];
            hourLabel.text = [NSString stringWithFormat:@"%d",startHour-12];
        }
        startHour ++;
        frame.origin.y += kLengthPerHour;
        
    }
}


- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetShouldAntialias(context, NO);
    [[UIColor colorWithWhite:0.85 alpha:1]setStroke];
    
    CGPoint top1 = CGPointMake(self.todayX, -200);
    CGPoint top2 = CGPointMake(self.tomorrowX, -200);
    CGPoint down1 = CGPointMake(self.todayX, rect.size.height+200);
    CGPoint down2 = CGPointMake(self.tomorrowX, rect.size.height+200);
    [self drawLineFrom:top1 to:down1 inContext:context];
    [self drawLineFrom:top2 to:down2 inContext:context];
    
    
    // horizantal line
    float dashLenght[] = {2,2};
    CGContextSetLineDash(context, 0, dashLenght, 2);
    
    CGFloat y = self.startY;
    while ( y < rect.size.height) {
        [self drawLineFrom:CGPointMake(self.startX, y) to:CGPointMake(rect.size.width-5, y) inContext:context];
        y += kLengthPerHour*2;
    }
    
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.9 alpha:1].CGColor);
    y = self.startY +kLengthPerHour;
    while ( y < rect.size.height) {
        [self drawLineFrom:CGPointMake(self.startX, y) to:CGPointMake(rect.size.width-5, y) inContext:context];
        y += kLengthPerHour*2;
    }

}

-(void)drawLineFrom:(CGPoint)a to:(CGPoint)b inContext:(CGContextRef)context
{
    CGPoint aPoints[2] = {a,b};//坐标点
    CGContextAddLines(context, aPoints, 2); // 添加线
    CGContextDrawPath(context, kCGPathStroke); // 根据坐标绘制路径
}


@end
