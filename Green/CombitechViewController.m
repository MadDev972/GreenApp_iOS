//
//  CombitechViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/31/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "CombitechViewController.h"

@interface CombitechViewController ()

@end

@implementation CombitechViewController
@synthesize text;


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
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"Combitech_intro" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.text loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼-8" baseURL:baseURL];
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
