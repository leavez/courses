//
//  UIColor+Hex.h
//  Meet
//
//  Created by lihui on 14-5-14.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexAndOpacity:(uint)hex;
+ (UIColor *) colorWithHex:(int)hex;

@end
