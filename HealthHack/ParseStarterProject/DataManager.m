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

-(void)updateTags{
    PFQuery *query = [PFQuery queryWithClassName:@"questions"];
    [query selectKeys:@[@"tag"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        if (results) {
            NSMutableOrderedSet *set= [NSMutableOrderedSet new];
            for (PFObject *obj in results) {
                [set addObject:obj[@"tag"]];
            }
            NSArray *distinctTags = [set array];
            if ([self.delegate respondsToSelector:@selector(receivedDataFromServer:)]) {
                [self.delegate receivedDataFromServer:distinctTags];
            }
        }
    }];
}

-(void)updateAnswersForQuestionID:(NSString *)questionID{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"questionID = %@",questionID];
    PFQuery *query = [PFQuery queryWithClassName:@"answers" predicate:predicate];
    [query selectKeys:@[@"answer"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * __nullable results, NSError * __nullable error) {
        if (results) {
            NSMutableArray *answers = [NSMutableArray new];
            for (PFObject *obj in results) {
                [answers addObject:obj[@"answer"]];
            }
            if ([self.delegate respondsToSelector:@selector(receivedDataFromServer:)]) {
                [self.delegate receivedDataFromServer:answers];
            }
        }
    }];
}

-(void)addAnswer:(NSString *)answer toQuestionWithID:(NSString *)questionID{
    PFQuery *query = [PFQuery queryWithClassName:@"questions"];
    [query getObjectInBackgroundWithId:questionID block:^(PFObject * __nullable object, NSError * __nullable error) {
        PFObject *answerToQuestion = [PFObject objectWithClassName:@"answers"];
        answerToQuestion[@"answer"] = answer;
        answerToQuestion[@"questionID"] = object[@"objectId"];
        
        [answerToQuestion saveInBackgroundWithBlock:^(BOOL succeeded, NSError * __nullable error) {
            if ([self.delegate respondsToSelector:@selector(receivedDataFromServer:)]) {
                [self.delegate receivedResponseFromServer:succeeded];
            }
        }];
    }];
}

@end
