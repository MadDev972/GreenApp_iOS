//
//  EntryViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/16/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "EntryViewController.h"
#import "DbHelper.h"

@interface EntryViewController ()

@end

@implementation EntryViewController
@synthesize factText;


-(void)newFact:(id)sender
{
    factText.text = [[DbHelper database] Fact];
}

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

    factText.text = [[DbHelper database] Fact];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
