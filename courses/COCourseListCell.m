//
//  COCourseListCell.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COCourseListCell.h"

@implementation COCourseListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)loadData:(COCourse*)one;
{
    self.title.text = one.name;
    self.location.text = one.location;
    self.weekDay.text = [COTool weekDayFromKind:one.weekday];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:MM"];
    self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",[formatter stringFromDate:one.startTime],[formatter stringFromDate:one.endTime]];
}

@end
