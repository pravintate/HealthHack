//
//  ViewController.h
//  HackProject
//
//  Created by Pawan Agarwal on 11/07/15.
//  Copyright (c) 2015 Pawan Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate, UISearchControllerDelegate>


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong,nonatomic) NSMutableArray *filteredArrayOfTags;

@end
