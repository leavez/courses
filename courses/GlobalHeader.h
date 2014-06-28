//
//  GlobalHeader.h
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#ifndef courses_GlobalHeader_h
#define courses_GlobalHeader_h

typedef enum {
    COColorBlue,
    COColorPurple,
    COColorGreen,
    COColorOrange,
    COColorRed
}COColor;
typedef enum {
    COWeekDayMonday,
    COWeekDayTuesday,
    COWeekDayWednesday,
    COWeekDayTursday,
    COWeekDayFriday,
    COWeekDaySaturday,
    COWeekDaySunday
}COWeekDay;

const static float kLengthPerHour = 60;
const static float kLengthPerSecond = kLengthPerHour/3600.f;
#endif
