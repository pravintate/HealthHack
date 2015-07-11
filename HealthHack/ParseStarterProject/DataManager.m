//
//  DataManager.m
//  ParseStarterProject
//
//  Created by Vinay Jain on 7/11/15.
//
//

#import "DataManager.h"

#import <Parse/Parse.h>

@implementation DataManager

-(void)addQuestionWithTitle:(NSString *)title withDescription:(NSString *)description andTag:(NSString*)tag{
    
    PFObject *question = [PFObject objectWithClassName:@"questions"];
    
    question[@"title"] = title;
    question[@"description"] = description;
    question[@"tag"] = tag;    
    [question saveInBackgroundWithBlock:^(BOOL succeeded, NSError * __nullable error) {
        [self.delegate receivedResponseFromServer:succeeded];
    }];
}

-(void)updateListOfQuestionsWithTag:(NSString *)tag{
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tag = %@",tag];
    PFQuery *query = [PFQuery queryWithClassName:@"questions" predicate:predicate];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * __nullable results, NSError * __nullable error) {
        if (results) {
            if ([self.delegate respondsToSelector:@selector(receivedDataFromServer:)]) {
                [self.delegate receivedDataFromServer:results];
            }
        }
    }];
}

-(void)addAnswer:(NSString *)answer toQuestionWithID:(NSString *)questiolnID{
    
    
    
}

@end
