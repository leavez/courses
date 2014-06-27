//
//  COCourseView.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COCourseView.h"
@interface COCourseView()
@property (nonatomic,assign) NSTimeInterval duration;
@end

@implementation COCourseView

+(instancetype)ViewFromNib
{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    COCourseView *view = [nibViews lastObject];
    view.frame = CGRectMake(0, 0, 100, 100);
    return view;
}


- (void)setCourse:(COCourse *)course{
    _course = course;
    
    // set appearance
    CGRect frame = self.frame;
    frame.size.height = self.duration * kLengthPerSecond;
    self.frame = frame;
    
    self.backgroundColor = [COTool colorFromKind:self.course.colorKind];
}


- (NSTimeInterval)duration{

    _duration = [self.course.endTime timeIntervalSinceDate:self.course.startTime];
    return _duration;
}
@end
