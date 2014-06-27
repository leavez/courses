//
//  COCourse.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COCourse.h"

@implementation COCourse

- (void)encodeWithCoder:(NSCoder *)aCoder;
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.startTime forKey:@"startTime"];
    [aCoder encodeObject:self.endTime forKey:@"endTime"];
    [aCoder encodeObject:@(self.weekday) forKey:@"weekday"];
    [aCoder encodeObject:@(self.colorKind) forKey:@"colorKind"];
}
- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if((self = [super init])) {
        //decode properties, other class vars
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.location = [aDecoder decodeObjectForKey:@"location"];
        self.startTime = [aDecoder decodeObjectForKey:@"startTime"];
        self.endTime = [aDecoder decodeObjectForKey:@"endTime"];
        self.weekday = [[aDecoder decodeObjectForKey:@"weekday"] intValue];
        self.colorKind = [[aDecoder decodeObjectForKey:@"colorKind"] intValue];
    }
    return self;
    
}

@end
