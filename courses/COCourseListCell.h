//
//  COCourseListCell.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COCourseListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *weekDay;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)loadData:(COCourse*)one;
@end
