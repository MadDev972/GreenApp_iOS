//
//  DbHelper.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "DbHelper.h"
#import "RestaurantLocation.h"
#import "StoreLocation.h"
#import "CafeLocation.h"
#import "Book.h"
#import "QuizzItem.h"
#import "Airport.h"
#import "Offer.h"
#import "Reference.h"


@implementation DbHelper

static DbHelper *_database;

+ (DbHelper*)database
{
    if (_database == nil)
    {
        _database = [[DbHelper alloc] init];
    }
    return _database;
}

- (id)init
{
    if ((self = [super init]))
    {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"myDBName"
                                                             ofType:@"sqlite3"];
                
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK)
        {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)RestaurantsLocations
{

    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT id, Name, Address, Latitude, Longitude, Telephone, Website, Comments FROM Food WHERE Type LIKE 'Restaurant'";
    
    sqlite3_stmt *statement;
        
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *addressChars = (char *) sqlite3_column_text(statement, 2);
            char *latitudeChars = (char *) sqlite3_column_text(statement, 3);
            char *longitudeChars = (char *) sqlite3_column_text(statement, 4);
            char *telephoneChars = (char *) sqlite3_column_text(statement, 5);
            char *websiteChars = (char *) sqlite3_column_text(statement, 6);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 7);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *address = [[NSString alloc] initWithUTF8String:addressChars];
            NSString *telephone = [[NSString alloc] initWithUTF8String:telephoneChars];
            NSString *website = [[NSString alloc] initWithUTF8String:websiteChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            double latitude = [[[NSString alloc] initWithUTF8String:latitudeChars] doubleValue];
            double longitude = [[[NSString alloc] initWithUTF8String:longitudeChars] doubleValue];

            
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = latitude;
            coordinate.longitude= longitude;

            RestaurantLocation *Restaurant = [[RestaurantLocation alloc] initWithUniqueId:uniqueId Name:name Address:address Coordinate:coordinate Phone:telephone Website:website Description:description];
            
            [retval addObject:Restaurant];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)CafesLocations
{
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT id, Name, Address, Latitude, Longitude, Telephone, Website, Comments FROM Food WHERE Type LIKE 'Café'";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *addressChars = (char *) sqlite3_column_text(statement, 2);
            char *latitudeChars = (char *) sqlite3_column_text(statement, 3);
            char *longitudeChars = (char *) sqlite3_column_text(statement, 4);
            char *telephoneChars = (char *) sqlite3_column_text(statement, 5);
            char *websiteChars = (char *) sqlite3_column_text(statement, 6);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 7);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *address = [[NSString alloc] initWithUTF8String:addressChars];
            double latitude = [[[NSString alloc] initWithUTF8String:latitudeChars] doubleValue];
            double longitude = [[[NSString alloc] initWithUTF8String:longitudeChars] doubleValue];
            NSString *telephone = [[NSString alloc] initWithUTF8String:telephoneChars];
            NSString *website = [[NSString alloc] initWithUTF8String:websiteChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = latitude;
            coordinate.longitude= longitude;
            
            CafeLocation *Cafe = [[CafeLocation alloc] initWithUniqueId:uniqueId Name:name Address:address Coordinate:coordinate Phone:telephone Website:website Description:description];
            
            [retval addObject:Cafe];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}


- (NSArray *)StoresLocations
{
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT id, Name, Address, Latitude, Longitude, Telephone, Website, Comments FROM Food WHERE Type LIKE 'Store'";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *addressChars = (char *) sqlite3_column_text(statement, 2);
            char *latitudeChars = (char *) sqlite3_column_text(statement, 3);
            char *longitudeChars = (char *) sqlite3_column_text(statement, 4);
            char *telephoneChars = (char *) sqlite3_column_text(statement, 5);
            char *websiteChars = (char *) sqlite3_column_text(statement, 6);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 7);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *address = [[NSString alloc] initWithUTF8String:addressChars];
            double latitude = [[[NSString alloc] initWithUTF8String:latitudeChars] doubleValue];
            double longitude = [[[NSString alloc] initWithUTF8String:longitudeChars] doubleValue];
            NSString *telephone = [[NSString alloc] initWithUTF8String:telephoneChars];
            NSString *website = [[NSString alloc] initWithUTF8String:websiteChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = latitude;
            coordinate.longitude= longitude;
            
            StoreLocation *Store = [[StoreLocation alloc] initWithUniqueId:uniqueId Name:name Address:address Coordinate:coordinate Phone:telephone Website:website Description:description];
            
            [retval addObject:Store];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

-(NSString *)Fact
{    
    NSString *str, *Comment;
    
    NSMutableString *myString = [NSMutableString string];

    int r = arc4random() % 81;

    str = [NSString stringWithFormat:@"%d",r];
    
    NSString *query = @"SELECT id,Comments FROM Quizzes WHERE id='";
    
    [myString appendString:query];
    [myString appendString:str];
    [myString appendString:@"'"];
    
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [myString UTF8String], -1, &statement, nil) == SQLITE_OK)
    {        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            char *charComment = (char *) sqlite3_column_text(statement, 1);
            
            Comment = [[NSString alloc] initWithUTF8String:charComment];
        }
        sqlite3_finalize(statement);
    }
    return Comment;
}

- (NSArray *)FactsInCategory:(NSString*)category
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSMutableString *myString = [NSMutableString string];
    
    NSString *query = @"SELECT id,Comments FROM Quizzes WHERE Category LIKE '";
    
    [myString appendString:query];
    [myString appendString:category];
    [myString appendString:@"'"];
        
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [myString UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            char *charComment = (char *) sqlite3_column_text(statement, 1);
            
            [retval addObject:[[NSString alloc] initWithUTF8String:charComment]];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)BooksInCategory:(NSString*)category
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSMutableString *myString = [NSMutableString string];
    
    NSString *query = @"SELECT id, Title, ScndaryTitle, Author, Year, ISBNnumber, Summary FROM Books WHERE Type LIKE '";
    
    [myString appendString:query];
    [myString appendString:category];
    [myString appendString:@"'"];
        
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [myString UTF8String], -1, &statement, nil) == SQLITE_OK)
    {        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *titleChars = (char *) sqlite3_column_text(statement, 1);
            char *subtitleChars = (char *) sqlite3_column_text(statement, 2);
            char *authorChars = (char *) sqlite3_column_text(statement, 3);
            char *dateChars = (char *) sqlite3_column_text(statement, 4);
            char *isbnChars = (char *) sqlite3_column_text(statement, 5);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 6);
            
            NSString *title = [[NSString alloc] initWithUTF8String:titleChars];
            NSString *subtitle = [[NSString alloc] initWithUTF8String:subtitleChars];
            NSString *author = [[NSString alloc] initWithUTF8String:authorChars];
            NSString *date = [[NSString alloc] initWithUTF8String:dateChars];
            NSString *isbn = [[NSString alloc] initWithUTF8String:isbnChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            NSMutableString *image = [NSMutableString string];
            [image appendString:@"book"];
            [image appendString: [NSString stringWithFormat:@"%d", uniqueId]];
            [image appendString:@".jpg"];
            
            Book *book = [[Book alloc]
                          initWithUniqueId:uniqueId Title:title Subtitle:subtitle Author:author Date:date ISBN:isbn Image:image Description:description];
            
            [retval addObject:book];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)MediasInCategory:(NSString*)category
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSMutableString *myString = [NSMutableString string];
    
    NSString *query = @"SELECT id, Title, Year, Summary FROM Movies WHERE Type LIKE '";
    
    [myString appendString:query];
    [myString appendString:category];
    [myString appendString:@"'"];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [myString UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *titleChars = (char *) sqlite3_column_text(statement, 1);
            char *dateChars = (char *) sqlite3_column_text(statement, 2);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 3);
            
            NSString *title = [[NSString alloc] initWithUTF8String:titleChars];
            NSString *date = [[NSString alloc] initWithUTF8String:dateChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            NSMutableString *image = [NSMutableString string];
            [image appendString:@"movie"];
            [image appendString: [NSString stringWithFormat:@"%d", uniqueId]];
            [image appendString:@".jpg"];
            
            Media *media = [[Media alloc]
                          initWithUniqueId:uniqueId Title:title Date:date Image:image Description:description];
            
            [retval addObject:media];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)QuizzesInCategory:(NSString*)category
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSMutableString *myString = [NSMutableString string];
    
    NSString *query = @"SELECT id, Question, Option1, Option2, Option3, Option4, Answer, Comments FROM Quizzes WHERE Category LIKE '";
    
    [myString appendString:query];
    [myString appendString:category];
    [myString appendString:@"'"];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [myString UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *questionChars = (char *) sqlite3_column_text(statement, 1);
            char *option1Chars = (char *) sqlite3_column_text(statement, 2);
            char *option2Chars = (char *) sqlite3_column_text(statement, 3);
            char *option3Chars = (char *) sqlite3_column_text(statement, 4);
            char *option4Chars = (char *) sqlite3_column_text(statement, 5);
            char *answerChars = (char *) sqlite3_column_text(statement, 6);
            char *commentChars = (char *) sqlite3_column_text(statement, 7);
            
            NSString *question = [[NSString alloc] initWithUTF8String:questionChars];
            NSString *choice1 = [[NSString alloc] initWithUTF8String:option1Chars];
            NSString *choice2 = [[NSString alloc] initWithUTF8String:option2Chars];
            NSString *choice3 = [[NSString alloc] initWithUTF8String:option3Chars];
            NSString *choice4 = [[NSString alloc] initWithUTF8String:option4Chars];
            NSString *answer = [[NSString alloc] initWithUTF8String:answerChars];
            NSString *comment = [[NSString alloc] initWithUTF8String:commentChars];

            QuizzItem *quizzItem = [[QuizzItem alloc]
                                    initWithUniqueId:uniqueId Question:question Choice1:choice1 Choice2:choice2 Choice3:choice3 Choice4:choice4 Answer:answer Comment:comment];
            
            [retval addObject:quizzItem];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

-(NSArray *) Airports
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT * FROM Airports";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *countryChars = (char *) sqlite3_column_text(statement, 3);
            char *latChars = (char *) sqlite3_column_text(statement, 4);
            char *longChars = (char *) sqlite3_column_text(statement, 5);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *country = [[NSString alloc] initWithUTF8String:countryChars];
            NSString *latitude = [[NSString alloc] initWithUTF8String:latChars];
            NSString *longitude = [[NSString alloc] initWithUTF8String:longChars];
            
            Airport *_airport = [[Airport alloc]
                                    initWithUniqueId:uniqueId Name:name City:city Country:country Latitude:latitude Longitude:longitude];
            
            [retval addObject:_airport];
        }
        sqlite3_finalize(statement);
    }
    return retval;

}

-(NSArray *) Offers
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT * FROM C_offers";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *detail1Chars = (char *) sqlite3_column_text(statement, 2);
            char *detail2Chars = (char *) sqlite3_column_text(statement, 3);
            char *detail3Chars = (char *) sqlite3_column_text(statement, 4);
            char *detail4Chars = (char *) sqlite3_column_text(statement, 5);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *detail1 = [[NSString alloc] initWithUTF8String:detail1Chars];
            NSString *detail2 = [[NSString alloc] initWithUTF8String:detail2Chars];
            NSString *detail3 = [[NSString alloc] initWithUTF8String:detail3Chars];
            NSString *detail4 = [[NSString alloc] initWithUTF8String:detail4Chars];
            
            Offer *_offer = [[Offer alloc] initWithUniqueId:uniqueId Name:name Detail1:detail1 Detail2:detail2 Detail3:detail3 Detail4:detail4];
            
            [retval addObject:_offer];
        }
        sqlite3_finalize(statement);
    }
    
    return retval;
}

-(NSArray *) References
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT * FROM C_references";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *descriptionChars = (char *) sqlite3_column_text(statement, 2);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *description = [[NSString alloc] initWithUTF8String:descriptionChars];
            
            Reference *_ref = [[Reference alloc] initWithUniqueId:uniqueId Name:name Description:description];
            
            [retval addObject:_ref];
        }
        sqlite3_finalize(statement);
    }
    
    return retval;
    
}

- (void)dealloc
{
    sqlite3_close(_database);
}

@end