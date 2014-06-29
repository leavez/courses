//
//  COCourseView.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COCourseView.h"
@interface COCourseView()
@end

@implementation COCourseView

+(instancetype)ViewFromNib
{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    COCourseView *view = [nibViews lastObject];
    view.frame = CGRectMake(0, 0, 100, 100);
    view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    view.layer.shadowRadius = 3;
    view.layer.shadowOffset = CGSizeMake(1, 1.5);
    view.layer.shadowOpacity = 0.3;
    return view;
}


- (void)setCourse:(COCourse *)course{
    _course = course;
    
    // set appearance
    CGRect frame = self.frame;
    frame.size.height = course.duration * kLengthPerSecond;
    self.frame = frame;
    
    self.backgroundColor = [COTool colorFromKind:self.course.colorKind];
    
    self.nameLabel.text = course.name;
    self.locationLabel.text = course.location;
}


@end
