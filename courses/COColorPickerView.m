//
//  COColorPickerView.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COColorPickerView.h"

@interface CustomButton : UIButton
@property (nonatomic,strong) UIView *indicator;
@property (nonatomic,strong) UIView *bottomLine;
@end

@interface COColorPickerView ()
@property (nonatomic,strong) NSMutableArray *buttons;
@end;

@implementation COColorPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUpViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews{
    self.buttons = [NSMutableArray array];
    CGRect frame = self.frame;
    CGFloat width = frame.size.width/5;
    CGFloat height = frame.size.height;
    for(int i=0 ; i<5 ;i++){
        CustomButton *button = [[CustomButton alloc] initWithFrame:CGRectMake(width*i, 0, width, height)];
        [self addSubview:button];
        [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [button setSelected:NO];
    }
    
    // set color
    int en = 0;
    for (UIButton *b in self.buttons) {
        b.backgroundColor = [COTool colorFromKind:en];
        en++;
    }
    
    //
    self.layer.cornerRadius = 2;
    self.layer.masksToBounds = YES;
    
    [self selectButton:[self.buttons firstObject]];
}

- (void)selectButton:(UIButton*)button
{
    for (UIButton *b in self.buttons) {
        [b setSelected:NO];
    }
    [button setSelected:YES];
}

- (COColor)getSelectedColor
{
    int en = 0;
    for (UIButton *b in self.buttons) {
        if ([b isSelected]) {
            return en;
        }
        en++;
    }
    return --en;
}

@end



@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.indicator = [[UIView alloc] initWithFrame:self.bounds];
//        self.indicator.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
//        self.indicator.hidden = YES;
//        self.indicator.userInteractionEnabled = NO;
//        [self addSubview:self.indicator];
        
        CGFloat height = 10;
        frame = self.bounds;
        frame.origin.y = frame.size.height - height;
        frame.size.height = height;
        self.bottomLine = [[UIView alloc] initWithFrame:frame];
        self.bottomLine.backgroundColor = [UIColor iOS7darkBlueColor];
        self.bottomLine.userInteractionEnabled = NO;
        self.bottomLine.hidden = YES;
        [self addSubview:self.bottomLine];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
//    self.indicator.hidden = selected;
    self.bottomLine.hidden = !selected;
}


@end
