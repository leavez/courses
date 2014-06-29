//
//  CODataCenter.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "CODataCenter.h"

static NSString * const kFirstUseKey = @"kFirstUseKey";
static NSString * const kCourseArrayKeyBase = @"kCourseArrayKeyBase";

@implementation CODataCenter

+(BOOL)isFirstlyAddCourse;
{
    return ![[NSUserDefaults standardUserDefaults] boolForKey:kFirstUseKey];
}

+(void)setFirstlyUseFlag;
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFirstUseKey];
}

+(instancetype)sharedInstance
{
    static dispatch_once_t once;
    static CODataCenter *_sharedInstance;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)addCourse:(COCourse*)courses;
{
    NSString *key = [self keyWithCourse:courses.weekday];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!array) {
        array = [NSMutableArray array];
    }
    [array addObject:courses];
    data = [NSKeyedArchiver archivedDataWithRootObject:array];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)saveDayCoursesArray:(NSMutableArray*)courses weekDay:(COWeekDay)weekday
{
    NSString *key = [self keyWithCourse:weekday];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:courses];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)deleteCourses:(NSArray*)courses;
{
    NSMutableArray *coursesOfEveryDayArray = [NSMutableArray array];
    for (int i =0 ; i<7; i++) {
        [coursesOfEveryDayArray addObject:[self getCoursesWithWeekday:i]];
    }
    for (COCourse *c in courses) {
        NSMutableArray *dayArray = coursesOfEveryDayArray[c.weekday];
        for (COCourse *savedCourse in dayArray) {
            if ([savedCourse isEqual:c]) {
                [dayArray removeObject:savedCourse];
                break;
            }
        }
    }
    
    // save
    int index = 0;
    for (NSMutableArray *dayArray in coursesOfEveryDayArray){
        NSString *key = [self keyWithCourse:index];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dayArray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
        index ++;
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSMutableArray*)getCoursesWithWeekday:(COWeekDay)weekday
{
    NSString *key = [self keyWithCourse:weekday];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSMutableArray *array;
    if (data) {
        array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    if (!array) {
        array = [NSMutableArray array];
    }
    return array;
}

- (NSMutableArray*)getAllCourses
{
    NSMutableArray *array = [NSMutableArray array];
    for(int i=0 ; i<7 ;i++){
        [array addObjectsFromArray:[self getCoursesWithWeekday:i]];
    }
    return array;
}

-(void)forceSave
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - tool

-(NSString *)keyWithCourse:(COWeekDay)weekday
{
    NSString *courseArrayKeyWithWeekDay = [NSString stringWithFormat:@"%@_%d",kCourseArrayKeyBase,weekday];
    return courseArrayKeyWithWeekDay;
}
@end
