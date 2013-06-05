//
//  CombitechCompViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/31/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "CombitechCompViewController.h"

@interface CombitechCompViewController ()

@end

@implementation CombitechCompViewController
@synthesize text;
@synthesize delay;


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
    
    NSString *urlAddress = @"http://www.combitech.se/en/Environment/";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    [NSThread detachNewThreadSelector:@selector(threadAnimating:) toTarget:self withObject:nil];
    
    [self.text loadRequest:requestObj];
    
}


-(void)threadAnimating:(id)data
{
    int i = 100000000;
        
    [self.delay startAnimating];
    
    while (i>0)
    {
        i--;
    }
    
    [self.delay stopAnimating];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.text = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
