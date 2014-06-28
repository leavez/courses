//
//  COMainPageBack.h
//  courses
//
//  Created by leave on 14-6-27.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COMainPageBack : UIView
@property (nonatomic,assign) CGFloat startX;
@property (nonatomic,assign) CGFloat startY;

@property (nonatomic,assign) CGFloat todayX;
@property (nonatomic,assign) CGFloat tomorrowX;
@property (nonatomic,assign) CGFloat courseWidth;

-(void)loadTimeLabels;
@end
