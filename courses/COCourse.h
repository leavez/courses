//
//  COCourse.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COCourse : NSObject <NSCoding>
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,assign) COWeekDay weekday;
@property (nonatomic,strong) NSDate *startTime;
@property (nonatomic,strong) NSDate *endTime;
@property (nonatomic,assign) COColor colorKind;
@end
