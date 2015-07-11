//
//  ViewController.m
//  ParseStarterProject
//
//  Created by Vinay Jain on 7/11/15.
//
//

#import "ViewController.h"
#import "DataManager.h"
@interface ViewController ()<DataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)receivedResponseFromServer:(BOOL)success{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (success){
            [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Your question has been posted" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        }
        else{
            [[[UIAlertView alloc] initWithTitle:@"Request Failed" message:@"There was some problem processing your question" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        }
    });
    
}
@end
