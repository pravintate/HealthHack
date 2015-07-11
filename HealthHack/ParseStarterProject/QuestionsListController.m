//
//  QuestionsListController.m
//  ParseStarterProject
//
//  Created by Vinay Jain on 7/11/15.
//
//

#import "QuestionsListController.h"
#import <Parse/Parse.h>

@interface QuestionsListController ()<DataDelegate>

@property (nonatomic,strong) NSArray *questions;

@end

@implementation QuestionsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.refreshControl beginRefreshing];
    [self refreshData:self.refreshControl];
    
}

- (IBAction)refreshData:(UIRefreshControl *)sender {
    DataManager *obj = [DataManager new];
    obj.delegate = self;
    [obj updateListOfQuestionsWithTag:@"diabetes"];
}
-(void)receivedDataFromServer:(NSArray *)results{
    
    self.questions = results;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    PFObject *obj = [self.questions objectAtIndex:indexPath.row];
    cell.textLabel.text = obj[@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    cell.detailTextLabel.text = obj[@"description"];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0 green:191.0/255.0 blue:243.0/255.0 alpha:1.0];
    cell.tag = [obj[@"tag"] intValue];
    return cell;
}

@end
