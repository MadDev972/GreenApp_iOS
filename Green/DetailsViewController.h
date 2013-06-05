//
//  DetailsViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

@property (nonatomic, assign) BOOL hideISBN;

@property (strong, nonatomic) IBOutlet UITextView *descriptionText;
@property (strong, nonatomic) IBOutlet UIImageView *cover;
@property (strong, nonatomic) IBOutlet UILabel *isbnNb;


@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *isbn;

@end
