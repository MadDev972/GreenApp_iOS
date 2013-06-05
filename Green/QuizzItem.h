//
//  QuizzItem.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/19/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizzItem : NSObject
{
    NSString *_question;
    NSString *_choice1;
    NSString *_choice2;
    NSString *_choice3;
    NSString *_choice4;
    NSString *_answer;
    NSString *_comment;
}

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *choice1;
@property (nonatomic, copy) NSString *choice2;
@property (nonatomic, copy) NSString *choice3;
@property (nonatomic, copy) NSString *choice4;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *comment;

- (id)initWithUniqueId:(int)uniqueId Question:(NSString*)question Choice1:(NSString *)choice1 Choice2:(NSString *)choice2 Choice3:(NSString *)choice3 Choice4:(NSString *)choice4 Answer:(NSString *)answer Comment:(NSString *)comment;

@end
