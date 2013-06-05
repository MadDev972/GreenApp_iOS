//
//  FoodLocation.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "FoodLocation.h"
#import <AddressBook/AddressBook.h>


@implementation FoodLocation

@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize address = _address;
@synthesize theCoordinate = _theCoordinate;
@synthesize phone = _phone;
@synthesize website = _website;
@synthesize description = _description;


- (id)initWithUniqueId:(int)uniqueId Name:(NSString*)name Address:(NSString*)address Coordinate:(CLLocationCoordinate2D)coordinate Phone:(NSString *)phone Website:(NSString*)website Description:(NSString *)description
{
    if ((self = [super init]))
    {
        self.uniqueId = uniqueId;
        
        self.name = name;
        
        self.address = address;
        
        self.theCoordinate = coordinate;
        
        self.phone = phone;
        
        self.website = website;
        
        self.description = description;
    }
    return self;
}

- (NSString *)title
{
    return _name;
}

- (NSString *)subtitle
{
    return _address;
}

- (CLLocationCoordinate2D)coordinate
{
    return _theCoordinate;
}

- (MKMapItem*)mapItem
{
    NSDictionary *addressDict = @{(NSString*)kABPersonAddressStreetKey : _address};
    
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:addressDict];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}

@end