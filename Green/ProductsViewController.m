//
//  ProductsViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "ProductsViewController.h"
#import "EnergyViewController.h"


@interface ProductsViewController ()

@end

@implementation ProductsViewController
@synthesize package;
@synthesize furniture;
@synthesize recycle;


-(void)calculateAndSave:(id)sender
{
    float coeff;
    
    int p = self.package.selectedSegmentIndex;
    switch (p)
    {
        case 0:
            coeff=0.0;
            break;
        case 1:
            coeff=0.03/12;
            break;
        case 2:
            coeff=0.06/12;
            break;
        case 3:
            coeff=0.11/12;
            break;
        default:
            break;
    }
    
    int f = self.furniture.selectedSegmentIndex;
    switch (f)
    {
        case 0:
            coeff+=0.04/12;
            break;
        case 1:
            coeff+=0.02/12;
            break;
        case 2:
            coeff+=0.01/12;
            break;
        case 3:
            coeff+=0.0;
            break;
        default:
            break;
    }
    
    int r = self.recycle.selectedSegmentIndex;
    switch (r)
    {
        case 0:
            coeff+=0.0;
            break;
        case 1:
            coeff+=0.03/12;
            break;
        case 2:
            coeff+=0.06/12;
            break;
        case 3:
            coeff+=0.11/12;
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
