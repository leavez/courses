//
//  COTimeIndicatorView.m
//  courses
//
//  Created by Leave on 6/29/14.
//  Copyright (c) 2014 leave. All rights reserved.
//

#import "COTimeIndicatorView.h"

@implementation COTimeIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, [COTool colorFromKind:COColorOrange].CGColor);
//    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);

    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context,rect.size.width,  rect.size.height/2);
    CGContextAddLineToPoint(context, 0 ,  rect.size.height);
    CGContextAddLineToPoint(context, 0 , 0);
    CGContextFillPath(context);
}

@end
