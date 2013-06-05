//
//  QuizzItem.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/19/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "QuizzItem.h"

@implementation QuizzItem

@synthesize question = _question;
@synthesize choice1 = _choice1;
@synthesize choice2 = _choice2;
@synthesize choice3 = _choice3;
@synthesize choice4 = _choice4;
@synthesize answer = _answer;
@synthesize comment = _comment;

- (id)initWithUniqueId:(int)uniqueId Question:(NSString *)question Choice1:(NSString *)choice1 Choice2:(NSString *)choice2 Choice3:(NSString *)choice3 Choice4:(NSString *)choice4 Answer:(NSString *)answer Comment:(NSString *)comment
{    
    self.question = question;
    
    self.choice1 = choice1;
    
    self.choice2 = choice2;
    
    self.choice3 = choice3;
    
    self.choice4 = choice4;
    
    self.answer = answer;
    
    self.comment = comment;
    
    return self;
}

@end
