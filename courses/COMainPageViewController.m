//
//  COMainPageViewController.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COMainPageViewController.h"
#import "CODataCenter.h"
#import "COMainPageBack.h"
#import "COCourseView.h"
#import "FlipTransition.h"

@interface COMainPageViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet COMainPageBack *backGridView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabelToday;
@property (weak, nonatomic) IBOutlet UILabel *dateLabelTomorrow;
@property (nonatomic,strong) NSMutableArray *courseViews;
@end

@implementation COMainPageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollview.contentSize = CGSizeMake(320, kLengthPerHour * 17 +35);
    CGRect frame = self.backGridView.frame ;
    frame.size.height = self.scrollview.contentSize.height;
    self.backGridView.frame = frame;
    [self.backGridView setNeedsDisplay];
    [self.backGridView loadTimeLabels];
    self.scrollview.backgroundColor = self.backGridView.backgroundColor;
    
    self.courseViews = [NSMutableArray array];
    
    // custom animation
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.dateLabelToday.text = [self getWeekDayFromDate:[NSDate date]];
    self.dateLabelTomorrow.text = [self getTomorrowStringFromDate:[NSDate dateWithTimeIntervalSinceNow:24*3600]];
    
    // load the course
    NSCalendar *calender = [NSCalendar currentCalendar];
    [calender setFirstWeekday:2];
    int weekday = [calender ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:[NSDate date]];
    weekday--;

    NSArray *todayCourses = [[CODataCenter sharedInstance] getCoursesWithWeekday:weekday];
    NSArray *tomorrowCourse = [[CODataCenter sharedInstance] getCoursesWithWeekday:((weekday + 1) % 7)];
    
    CGRect baseFrame = CGRectMake(self.backGridView.todayX, self.backGridView.startY -6*kLengthPerHour, self.backGridView.courseWidth, 0);
    
    // set up the posistion of course views
    void (^setUpTheFrameBlock)(COCourse *course, CGRect baseFrame) = ^(COCourse *data, CGRect baseFrame){
        COCourseView *aCourse = [COCourseView ViewFromNib];
        CGRect frame = baseFrame;
        frame.origin.y += (kLengthPerSecond * data.startTime);
        aCourse.frame = frame;
        aCourse.course = data; // 这里会自动设置view的高度
        [self.scrollview addSubview:aCourse];
        [self.courseViews addObject:aCourse];
    };
    
    for (UIView *v in self.courseViews) {
        [v removeFromSuperview];
    }
    [self.courseViews removeAllObjects];
    
    for (COCourse *data in todayCourses) {
        setUpTheFrameBlock(data,baseFrame);
    }
    baseFrame.origin.x = self.backGridView.tomorrowX;
    for (COCourse *data in tomorrowCourse) {
        setUpTheFrameBlock(data,baseFrame);
    }

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"manage"]) {
        COMainPageViewController *vc =(COMainPageViewController*)segue.destinationViewController;
        vc.transitioningDelegate = self;
    }
}


#pragma mark --  custom transition delegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController  animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC  toViewController:(UIViewController *)toVC
{
    return [FlipTransition new];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    return [FlipTransition new];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
{
    return [FlipTransition new];
}


#pragma mark -- tool

-(NSString *)getWeekDayFromDate:(NSDate*)date
{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"EEEE. d";
    return [formater stringFromDate:date];
}
-(NSString *)getTomorrowStringFromDate:(NSDate*)date
{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"'Tomorrow.' d";
    return [formater stringFromDate:date];
}


@end
