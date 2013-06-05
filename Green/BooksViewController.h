//
//  BookInfoViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksViewController : UITableViewController

@property (nonatomic, strong) NSArray *Books;
@property (nonatomic, copy) NSString *category;

@end

