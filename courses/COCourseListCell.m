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
    if(one.location && ![one.location isEqualToString:@""]){
        self.location.text = one.location;
    }else{
        self.location.text = @"嘻嘻";
    }
    self.weekDay.text = [COTool weekDayFromKind:one.weekday];
    NSDate *stratDate = [[COTool getMidnightDateOfToday] dateByAddingTimeInterval:one.startTime];
    NSDate *endDate = [stratDate dateByAddingTimeInterval:one.duration];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM"];
    self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",[formatter stringFromDate:stratDate],[formatter stringFromDate:endDate]];
}

@end
