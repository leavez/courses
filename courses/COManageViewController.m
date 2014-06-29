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
@property (weak, nonatomic) IBOutlet UIButton *bottomLabelButton;
@property (strong, nonatomic) UIBarButtonItem *deleteButton;

@property (strong,nonatomic) NSMutableArray *dataArray;
@end

@implementation COManageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (UIBarButtonItem *item in self.toolbarItems) {
        item.tintColor = [COTool colorFromKind:COColorBlue];
    }
    [self.bottomLabelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.tableview.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.95 alpha:1];
    self.tableview.allowsSelection = NO;
    self.tableview.tintColor = [COTool colorFromKind:COColorOrange];

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataArray = [[CODataCenter sharedInstance] getAllCourses];
    [self.tableview reloadData];
    [self.bottomLabelButton setTitle:[NSString stringWithFormat:@"共有%d节课",self.dataArray.count] forState:UIControlStateNormal];

}
- (IBAction)didTapReturnButton:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    self.tableview.allowsMultipleSelectionDuringEditing = editing;
    self.tableview.allowsSelection = editing;
    [super setEditing:editing animated:animated];
    
    [self.tableview setEditing:editing animated:YES];
    
    // show the trash button
    if(editing == YES)
    {
        if (!self.deleteButton) {
            self.deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(didTapDeleteButton:)];
            self.deleteButton.tintColor = [COTool colorFromKind:COColorBlue];
        }
        self.toolbarItems = [[NSMutableArray arrayWithObject:self.deleteButton] arrayByAddingObjectsFromArray:self.toolbarItems];
    } else {
        NSMutableArray *items = [self.toolbarItems mutableCopy];
        [items removeObject:self.deleteButton];
        self.toolbarItems = items;
    }
}

- (IBAction)didTapDeleteButton:(id)sender {
    NSArray *deletedIndexpaths = [self.tableview indexPathsForSelectedRows];
    NSMutableArray *deleteItems = [NSMutableArray array];
    for (NSIndexPath *indexpath in deletedIndexpaths) {
        [deleteItems addObject:self.dataArray[indexpath.row]];
    }
    [self.dataArray removeObjectsInArray:deleteItems];
    [self.tableview beginUpdates];
    [self.tableview deleteRowsAtIndexPaths:deletedIndexpaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableview endUpdates];
    
    [[CODataCenter sharedInstance] deleteCourses:deleteItems];
}

#pragma mark - data source & delegate

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 65;
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        COCourse *course = [self.dataArray objectAtIndex:indexPath.row];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [[CODataCenter sharedInstance] deleteCourses:@[course]];
    }
}

@end
