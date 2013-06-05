//
//  Resource.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Airport.h"

@implementation Airport

@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize city = _city;
@synthesize country = _country;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;


- (id)initWithUniqueId:(int)uniqueId Name:(NSString *)name City:(NSString *)city Country:(NSString *)country Latitude:(NSString *)latitude Longitude:(NSString *)longitude
{
    if ((self = [super init]))
    {
        self.uniqueId = uniqueId;
        
        self.name = name;
        
        self.city = city;
        
        self.country = country;
        
        self.latitude = latitude;
        
        self.longitude = longitude;
    }
    return self;
};

@end
