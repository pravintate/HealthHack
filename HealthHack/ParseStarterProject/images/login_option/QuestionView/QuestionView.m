//
//  QuestionView.m
//  HealthHack
//
//  Created by Pravin Tate on 7/11/15.
//  Copyright © 2015 Vinay Jain. All rights reserved.
//

#import "QuestionView.h"
#import "DataManager.h"

@interface QuestionView () <DataDelegate>
{
    __weak IBOutlet UITextField * questionTitle;
    __weak IBOutlet UITextView * questionDescription;
    __weak IBOutlet UITextField * questionTag;
    __weak IBOutlet UIButton * SubmitButton;
    
    
    __weak id inputArea;
}
@end


@implementation QuestionView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- Question -----

- (IBAction)questionSubmitButtonClicked:(id)sender {
    
    if (questionTitle.text.length <= 0) {
        [self showAlertViewWithMessage:@"" msg:@"Please fill question titile" inputField:questionTitle];
    }
    else if (questionDescription.text.length <= 0) {
        [self showAlertViewWithMessage:@"" msg:@"Please fill question description" inputField:questionDescription];
    }
    else if (questionTag.text.length <= 0) {
        [self showAlertViewWithMessage:@"" msg:@"Please fill question tag" inputField:questionTag];
    }
    else
    {
        [self sendDataToServer];
    }
}

-(void) sendDataToServer
{
    DataManager *obj = [DataManager new];
    obj.delegate = self;
    [obj addQuestionWithTitle:questionTitle.text
                withDescription:questionDescription.text
                        andTag:questionTag.text];
    
    
}



-(void)showAlertViewWithMessage:(NSString*)title msg:(NSString *)msg inputField:(id)inputField
{
   
    if ([inputField isKindOfClass:[UITextField class]]) {
        inputArea = (UITextField *)inputField;
      
    }
    else if([inputField isKindOfClass:[UITextView class]]) {
        inputArea  = (UITextView *)inputField;
      
    }
        
    
    
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title
                                                     message:msg
                                                    delegate:self
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
 }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [inputArea resignFirstResponder];
}
-(void)receivedResponseFromServer:(BOOL)success{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (success){
            [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Your question has been posted" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
            
            questionTag.text = @"";
            questionTitle.text= @"";
            questionDescription.text = @"";
            
            
        }
        else{
            [[[UIAlertView alloc] initWithTitle:@"Request Failed" message:@"There was some problem processing your question" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        }
    });
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
