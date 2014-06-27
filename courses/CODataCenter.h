//
//  CODataCenter.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COCourse.h"

@interface CODataCenter : NSObject

+(BOOL)isFirstlyAddCourse;
+(void)setFirstlyUseFlag;


+(instancetype)sharedInstance;

- (void)addCourse:(COCourse*)courses;

- (NSMutableArray*)getCoursesWithWeekday:(COWeekDay)weekday;
- (NSMutableArray*)getAllCourses;

@end
