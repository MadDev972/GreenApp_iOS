//
//  Book.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Media.h"

@interface Book : Media
{
    NSString *_subtitle;
    NSString *_author;
    NSString *_isbn;
}

@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *isbn;

- (id)initWithUniqueId:(int)uniqueId Title:(NSString*)title Subtitle:(NSString *)subtitle Author:(NSString *)author Date:(NSString *)date ISBN:(NSString *)isbn Image:(NSString *)image Description:(NSString *)description;

@end
