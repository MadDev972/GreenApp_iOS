//
//  Airport.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/23/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Airport : NSObject
{
    int _uniqueId;
    NSString *_name;
    NSString *_city;
    NSString *_country;
    NSString *_latitude;
    NSString *_longitude;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;

- (id)initWithUniqueId:(int)uniqueId Name:(NSString*)name City:(NSString*)city Country:(NSString *)country
Latitude:(NSString*)latitude Longitude:(NSString*)longitude;
@end
