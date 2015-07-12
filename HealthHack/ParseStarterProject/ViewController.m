//
//  ViewController.m
//  HackProject
//
//  Created by Pawan Agarwal on 11/07/15.
//  Copyright (c) 2015 Pawan Agarwal. All rights reserved.
//

#import "ViewController.h"
#import "TagsCollectionViewCell.h"


@interface ViewController ()<DataDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSMutableArray *arrayOfTags;
@property (strong,nonatomic) NSMutableArray *arrayOfImages;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filteredArrayOfTags = [NSMutableArray arrayWithCapacity:10];
    self.searchBar.delegate = self;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background1.png"]];
    [self.collectionView setBackgroundView:imageView];
    
    
    
//    self.arrayOfTags = [[NSMutableArray alloc]initWithObjects:@"pawan",@"test",@"praxify",@"health",@"care",@"test",@"app",@"for",@"quora",@"created",@"application",@"hack",@"healthhack",@"enjoy",@"awesome", nil];
//    
    self.arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"b_01.png",@"b_02.png",@"b_03.png",@"b_04.png",@"b_05.png",@"b_06.png",@"b_07.png",@"b_08.png",@"b_09.png",@"b_10.png",@"b_11.png",@"b_12.png",@"b_13.png",@"b_14.png",@"b_15.png", nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    DataManager *obj = [DataManager new];
    obj.delegate = self;
    [obj updateTags];
}

-(void)receivedDataFromServer:(NSArray *)results{
    
    self.arrayOfTags = [results mutableCopy];
    [self.collectionView reloadData];
}

#pragma Mark CollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrayOfTags count];
    
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView
{
    // add the tableview back in
    [self.view addSubview:self.searchDisplayController.searchResultsTableView];
}

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    // after the data has been preloaded
    //    self.searchResults = self.allItems;
    [self.searchDisplayController.searchResultsTableView reloadData];
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    [self.view addSubview:self.searchDisplayController.searchResultsTableView];
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TagsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagsCell" forIndexPath:indexPath];
    if ([self.arrayOfTags count]>indexPath.row && [self.arrayOfImages count]>indexPath.row) {
        [cell.tagsButton setTitle:[self.arrayOfTags objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    
    //    [cell.tagsButton setTitle:[self getNameOfTheButton] forState:UIControlStateNormal ];
    if ([self.arrayOfTags count]>indexPath.row && [self.arrayOfImages count]>indexPath.row) {
        [cell.imageForTags setImage:[UIImage imageNamed:[self.arrayOfImages objectAtIndex:indexPath.row]]];
    }
    
    //    [cell setBackgroundColor:[UIColor blueColor]];
    return cell;
    
}

-(NSString*) getNameOfTheButton {
    return [self.arrayOfTags objectAtIndex:arc4random()%[self.arrayOfTags count]];
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredArrayOfTags removeAllObjects];
    // Filter the array using NSPredicate
}
#pragma Mark UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.searchBar resignFirstResponder];
    self.arrayOfTags = [[NSMutableArray alloc]initWithObjects:@"test",@"pawan",@"test",@"pawan",@"test",@"pawan",@"test",@"pawan",@"test", nil];
    [self.collectionView reloadData];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
    
}// return NO to not become first responder

@end

