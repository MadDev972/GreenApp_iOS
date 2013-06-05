//
//  FoodLocation.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface FoodLocation : NSObject <MKAnnotation>
{
    int _uniqueId;
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _theCoordinate;
    NSString *_phone;
    NSString *_website;
    NSString *_description;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *website;
@property (nonatomic, copy) NSString *description;


- (id)initWithUniqueId:(int)uniqueId Name:(NSString*)name Address:(NSString*)address Coordinate:(CLLocationCoordinate2D)coordinate Phone:(NSString*)phone Website:(NSString*)website Description:(NSString*)description;
- (MKMapItem*)mapItem;

@end
