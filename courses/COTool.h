//
//  COTool.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COTool : NSObject
+(UIColor *)colorFromKind:(COColor)kind;
+(UIColor *)darkColorFromKind:(COColor)kind;
+(NSString *)weekDayFromDate:(NSDate*)date;
+(NSString *)weekDayFromKind:(COWeekDay)dayKind;

@end
