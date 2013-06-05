//
//  Reference.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Reference.h"

@implementation Reference
@synthesize name = _name;
@synthesize description = _description;

-(id)initWithUniqueId:(int)uniqueId Name:(NSString *)name Description:(NSString *)description
{
    if ((self = [super init]))
    {
        self.name = name;
        self.description = description;
    }
    return self;
}

@end
