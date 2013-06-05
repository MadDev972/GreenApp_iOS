//
//  Reference.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reference : NSObject
{
    NSString *_name;
    NSString *_description;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;

- (id)initWithUniqueId:(int)uniqueId Name:(NSString*)name Description:(NSString*)description;

@end
