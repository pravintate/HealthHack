//
//  QuestionViewController.h
//  ParseStarterProject
//
//  Created by Vinay Jain on 7/12/15.
//
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) NSString *questionID;
@end
