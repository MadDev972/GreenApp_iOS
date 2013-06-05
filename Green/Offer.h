//
//  Offer.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Offer : NSObject
{
    NSString *_name;
    NSString *_detail1;
    NSString *_detail2;
    NSString *_detail3;
    NSString *_detail4;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail1;
@property (nonatomic, copy) NSString *detail2;
@property (nonatomic, copy) NSString *detail3;
@property (nonatomic, copy) NSString *detail4;


- (id)initWithUniqueId:(int)uniqueId Name:(NSString*)name Detail1:(NSString *)detail1 Detail2:(NSString *)detail2 Detail3:(NSString *)detail3 Detail4:(NSString *)detail4;

@end
