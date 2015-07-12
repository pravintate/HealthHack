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
    
    self.title = [self.tag capitalizedString];
    
    NSDictionary *attributes = @{
                                NSForegroundColorAttributeName : [UIColor whiteColor]
                                };
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.refreshControl beginRefreshing];
    [self refreshData:self.refreshControl];
    
}

- (IBAction)refreshData:(UIRefreshControl *)sender {
    DataManager *obj = [DataManager new];
    obj.delegate = self;
    [obj updateListOfQuestionsWithTag:self.tag];
}
-(void)receivedDataFromServer:(NSArray *)results{
    
    self.questions = results;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:0.556 alpha:1];
    self.tableView.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:0.556 alpha:1];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questions count];
}

-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    PFObject *obj = [self.questions objectAtIndex:indexPath.row];
    cell.textLabel.text = obj[@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    cell.detailTextLabel.text = obj[@"description"];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.573 green:0.994 blue:1 alpha:1];
    cell.tag = [obj[@"tag"] intValue];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0.793 blue:0.963 alpha:0.6];
    return cell;
}

@end
