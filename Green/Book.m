//
//  Book.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize subtitle = _subtitle;
@synthesize author = _author;
@synthesize isbn = _isbn;

- (id)initWithUniqueId:(int)uniqueId Title:(NSString*)title Subtitle:(NSString *)subtitle Author:(NSString *)author Date:(NSString *)date ISBN:(NSString *)isbn Image:(NSString *)image Description:(NSString *)description
{
    self = [self initWithUniqueId:uniqueId Title:title Date:date Image:image Description:description];
    
    self.subtitle = subtitle;
    
    self.author = author;
    
    self.isbn = isbn;
    
    return self;
}


@end
