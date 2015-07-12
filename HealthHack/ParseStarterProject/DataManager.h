//
//  DataManager.h
//  ParseStarterProject
//
//  Created by Vinay Jain on 7/11/15.
//
//

#import <Foundation/Foundation.h>


@protocol DataDelegate <NSObject>

@optional
-(void)receivedResponseFromServer:(BOOL)success;
-(void)receivedDataFromServer:(NSArray *)results;

@end

@interface DataManager : NSObject

@property(nonatomic,weak) id<DataDelegate> delegate;

-(void)addQuestionWithTitle:(NSString *)title withDescription:(NSString *)description andTag:(NSString*)tag;
-(void)updateListOfQuestionsWithTag:(NSString *)tag;
-(void)updateTags;
-(void)updateAnswersForQuestionID:(NSString *)questionID;
-(void)addAnswer:(NSString *)answer toQuestionWithID:(NSString *)questionID;
@end
