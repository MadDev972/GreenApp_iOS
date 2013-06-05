//
//  Resource.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Media.h"

@implementation Media

@synthesize uniqueId = _uniqueId;
@synthesize title = _title;
@synthesize date = _date;
@synthesize image = _image;
@synthesize description = _description;


- (id)initWithUniqueId:(int)uniqueId Title:(NSString*)title Date:(NSString*)date Image:(NSString *)image
           Description:(NSString*)description
{
    if ((self = [super init]))
    {
        self.uniqueId = uniqueId;
        
        self.title = title;
        
        self.date = date;
        
        self.image = image;
        
        self.description = description;
    }
    return self;
};

@end
