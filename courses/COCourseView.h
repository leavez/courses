//
//  COCourseView.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COCourse.h"

@interface COCourseView : UIView
@property (nonatomic,strong) COCourse *course;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
+(instancetype)ViewFromNib;
@end
