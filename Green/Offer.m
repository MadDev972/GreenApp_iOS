//
//  Offer.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "Offer.h"

@implementation Offer

@synthesize name = _name;
@synthesize detail1 = _detail1;
@synthesize detail2 = _detail2;
@synthesize detail3 = _detail3;
@synthesize detail4 = _detail4;


- (id)initWithUniqueId:(int)uniqueId Name:(NSString *)name Detail1:(NSString *)detail1 Detail2:(NSString *)detail2 Detail3:(NSString *)detail3 Detail4:(NSString *)detail4
{    
    self.name = name;
    
    self.detail1 = detail1;
    
    self.detail2 = detail2;
    
    self.detail3 = detail3;
    
    self.detail4 = detail4;
    
    return self;
}


@end
