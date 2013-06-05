//
//  ProduceViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "ProduceViewController.h"
#import "EnergyViewController.h"


@interface ProduceViewController ()

@end

@implementation ProduceViewController
@synthesize organic;
@synthesize season;
@synthesize local;


-(void)calculateAndSave:(id)sender
{
    int coeff;
    
    int o = self.organic.selectedSegmentIndex;
    int s = self.season.selectedSegmentIndex;
    int l = self.local.selectedSegmentIndex;

    switch(o)
    {
        case 0:
            coeff=0.0;
            break;
        case 1:
            coeff=0.02/12;
            break;
        case 2:
            coeff=0.03/12;
            break;
        default:
            break;
    }
    
    switch(s)
    {
        case 0:
            coeff+= 0.0;
            break;
        case 1:
            coeff+=0.03/12;
            break;
        case 2:
            coeff+=0.04/12;
            break;
        default:
            break;
    }
    
    switch(l)
    {
        case 0:
            coeff+=0.02/12;
            break;
        case 2:
            coeff+=0.04/12;
            break;
        case 3:
            coeff+=0.07/12;
            break;
        case 4:
            coeff+=0.09/12;
            break;
        default:
            break;
    }
    
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:coeff]];
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
