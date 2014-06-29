//
//  COAddViewController.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COAddViewController.h"
#import "COColorPickerView.h"
#import "CODataCenter.h"

@interface COAddViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *weekDayPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *startTimePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTimePicker;
@property (weak, nonatomic) IBOutlet COColorPickerView *colorPicker;

@end

@implementation COAddViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollview.contentSize = CGSizeMake(320, 500);
    
    // appearance
    self.weekDayPicker.tintColor = [UIColor iOS7darkBlueColor];
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"课程名称" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:80./255. alpha:1]}];
    self.nameField.attributedPlaceholder = placeholder;
    placeholder = [[NSAttributedString alloc] initWithString:@"地点 教室" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:80./255. alpha:1]}];
    [self.locationField setAttributedPlaceholder:placeholder];
    self.weekDayPicker.tintColor = [COTool colorFromKind:COColorBlue];
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.95 alpha:1];
    self.nameField.backgroundColor = self.view.backgroundColor;
    self.locationField.backgroundColor = self.view.backgroundColor;
    
    // keyboard dismiss
    self.nameField.delegate = self;
    self.locationField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)];
    [self.view addGestureRecognizer:tap];
    
    // watch the date picker
    [self.startTimePicker  addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)dealloc
{
    [self.startTimePicker removeTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)didTapFinishButton:(id)sender {
    if ([CODataCenter isFirstlyAddCourse]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"第一次使用？" message:@"课程的时间会决定课程的显示效果，请准确填写课程时间" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles: nil];
        [alert show];
        [CODataCenter setFirstlyUseFlag];
        return;
    }
    [self addCourse];
    
}

- (void)addCourse
{
    // check
    NSString *name = self.nameField.text;
    if (!name || [name isEqualToString:@""]) {
        [MBProgressHUD showTimedTextHUDOnView:self.navigationController.view message:@"请填入课程名称" animated:YES];
        return;
    }
    NSDate *startTime = self.startTimePicker.date;
    NSDate *endTime = self.endTimePicker.date;
    if ([endTime timeIntervalSinceDate:startTime] <= 60*4) {
        // notify not valide
        [MBProgressHUD showTimedTextHUDOnView:self.navigationController.view message:@"请正确选择时间" animated:YES];
        return;
    }
    
    // generate a course
    COCourse *course = [[COCourse alloc] init];
    course.name = name;
    course.location = self.locationField.text;
    course.startTime = [startTime timeIntervalSinceDate:[COTool getMidnightDateOfToday]];
    course.duration = [endTime timeIntervalSinceDate:startTime];
    course.weekday = self.weekDayPicker.selectedSegmentIndex;
    course.colorKind = [self.colorPicker getSelectedColor];
    
    // add
    [[CODataCenter sharedInstance] addCourse:course];
    
    [MBProgressHUD showTimedTextHUDOnView:self.navigationController.view message:@"添加成功了呀" animated:YES];
}
- (IBAction)didTapBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dateChanged{
    NSDate *startTime = self.startTimePicker.date;
    startTime = [startTime dateByAddingTimeInterval:3600*2];
    [self.endTimePicker setDate:startTime];
}


#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    if (textField == self.nameField) {
        [self.locationField becomeFirstResponder];
    }else{
        [self.view endEditing:YES];
    }
    return YES;
}

@end
