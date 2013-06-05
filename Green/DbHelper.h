//
//  DbHelper.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DbHelper : NSObject
{
    sqlite3 *_database;
}

+ (DbHelper*)database;
- (NSArray *)RestaurantsLocations;
- (NSArray *)CafesLocations;
- (NSArray *)StoresLocations;
- (NSArray *)Airports;
- (NSString *)Fact;

- (NSArray *)FactsInCategory:(NSString *)category;
- (NSArray *)BooksInCategory:(NSString *)category;
- (NSArray *)MediasInCategory:(NSString *)category;
- (NSArray *)QuizzesInCategory:(NSString *)category;
- (NSArray *)Offers;
- (NSArray *)References;


@end
