//
//  FoodLocation.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Media : NSObject
{
    int _uniqueId;
    NSString *_title;
    NSString *_date;
    NSString *_image;
    NSString *_description;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *description;

- (id)initWithUniqueId:(int)uniqueId Title:(NSString*)title Date:(NSString*)date Image:(NSString *)image
                                     Description:(NSString*)description;

@end
