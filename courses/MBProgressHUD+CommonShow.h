//
//  MBProgressHUD+CommonShow.h
//  Meet
//
//  Created by lihui on 14-5-22.
//  Copyright (c) 2014年 renren. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (CommonShow)

+ (void)showTimedTextHUDOnView:(UIView *)view message:(NSString *)message animated:(BOOL)animated;
+ (void)showTimedTextHUDOnView:(UIView *)view
                       message:(NSString *)message
                      animated:(BOOL)animated
               completionBlock:(MBProgressHUDCompletionBlock)completionBlock;
+ (void)showTimedTextHUDOnView:(UIView *)view message:(NSString *)message animated:(BOOL)animated yOffset:(CGFloat)yOffset;

+ (void)showLoadingHUDOnView:(UIView *)view message:(NSString *)message animated:(BOOL)animated;

+ (void)removeAllHUDOnView:(UIView *)view animated:(BOOL)animated;

+ (void)showLoadingHUDOnView:(UIView *)view yOffset:(CGFloat)yOffset message:(NSString *)message animated:(BOOL)animated;

+ (void)showTimedHUDOnView:(UIView *)view text:(NSString *)text image:(UIImage *)image animated:(BOOL)animated;


@end
