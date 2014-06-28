//
//  COManageViewController.m
//  courses
//
//  Created by leave on 14-6-26.
//  Copyright (c) 2014年 leave. All rights reserved.
//

#import "COManageViewController.h"
#import "COCourseListCell.h"
#import "CODataCenter.h"
#import "FlipTransition.h"

@interface COManageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (strong,nonatomic) NSMutableArray *dataArray;
@end

@implementation COManageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataArray = [[CODataCenter sharedInstance] getAllCourses];
    [self.tableview reloadData];

}
- (IBAction)didTapReturnButton:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    COCourseListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    COCourse *one = self.dataArray[indexPath.row];
    [cell loadData:one];
    return cell;
}



@end
