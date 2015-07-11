//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

@interface ParseStarterProjectViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *importedImage;

@end

@implementation ParseStarterProjectViewController

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.importedImage.image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    
    
    
}
- (IBAction)importImage:(id)sender {
    
    UIImagePickerController *imageController = [[UIImagePickerController alloc] init];
    imageController.delegate = self;
    imageController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imageController.allowsEditing = false;
    
    [self presentViewController:imageController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
