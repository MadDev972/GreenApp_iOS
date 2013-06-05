//
//  DetailsViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize image;
@synthesize description;
@synthesize isbn;
@synthesize cover;
@synthesize descriptionText;
@synthesize isbnNb;
@synthesize hideISBN;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];

    self.cover.image = [UIImage imageNamed:self.image];
    self.descriptionText.text = self.description;
    
    if (hideISBN)
        [self.isbnNb removeFromSuperview];
    else
        self.isbnNb.text = self.isbn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
