//
//  COTool.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COTool.h"

@implementation COTool

+(UIColor *)colorFromKind:(COColor)kind;
{
    return [self ios7ColorWithKind:kind];
}

+(UIColor *)ios7ColorWithKind:(COColor)kind;
{
    switch (kind) {
        case COColorBlue:
            return [UIColor iOS7lightBlueColor];
        case COColorPurple:
            return [UIColor iOS7purpleColor];
        case COColorGreen:
            return [UIColor iOS7greenColor];
        case COColorOrange:
            return [UIColor iOS7orangeColor];
        case COColorRed:
            return [UIColor iOS7redColor];
        default:
            return [UIColor iOS7lightBlueColor];
    }
}

+(UIColor *)androidColorFromKind:(COColor)kind;
{
    int hex ;
    switch (kind) {
        case COColorBlue:
            hex = 0x33B5E5;
            break;
        case COColorPurple:
            hex = 0xAA66CC;
            break;
        case COColorGreen:
            hex = 0x99cc00;
            break;
        case COColorOrange:
            hex = 0xFFBB33;
            break;
        case COColorRed:
            hex = 0xFF4444;
            break;
        default:
            hex = 0x33B5e5;
            break;
    }
    return [UIColor colorWithHex:hex];
}
+(UIColor *)darkColorFromKind:(COColor)kind;
{
    int hex ;
    switch (kind) {
        case COColorBlue:
            hex = 0x0099CC;
            break;
        case COColorPurple:
            hex = 0x9933cc;
            break;
        case COColorGreen:
            hex = 0x669900;
            break;
        case COColorOrange:
            hex = 0xFf8800;
            break;
        case COColorRed:
            hex = 0xcc0000;
            break;
        default:
            hex = 0x0099cc;
            break;
    }
    return [UIColor colorWithHex:hex];
}

+(NSString *)weekDayFromDate:(NSDate*)date
{
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setDateFormat:@"EEEE"];
    return [weekday stringFromDate:date];
}
+(NSString *)weekDayFromKind:(COWeekDay)dayKind;
{
    switch (dayKind) {
        case COWeekDayMonday:
            return @"星期一";
            break;
            case COWeekDayTuesday:
            return @"星期二";
            break;
            case COWeekDayWednesday:
            return @"星期三";
            break;
            case COWeekDayTursday:
            return @"星期四";
            break;
            case COWeekDayFriday:
            return @"星期五";
            break;
            case COWeekDaySaturday:
            return @"星期六";
            break;
            case COWeekDaySunday:
            return @"星期日";
            break;
        default:
            return @"不知道";
            break;
    }
}
@end
