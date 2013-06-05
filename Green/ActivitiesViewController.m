//
//  ActivitiesViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "ActivitiesViewController.h"
#import "EnergyViewController.h"


@interface ActivitiesViewController ()

@end

@implementation ActivitiesViewController
@synthesize shop;
@synthesize activities;
@synthesize cars;
@synthesize nbCars;
@synthesize bank;


-(void)calculateAndSave:(id)sender
{
    double coeff;
    
    int s = self.shop.selectedSegmentIndex;
    switch(s)
    {
        case 0:
            coeff=0.02/12;
            break;
        case 1:
            coeff=0.01/12;
            break;
        case 2:
            coeff = 0.0;
            break;
        default:
            break;
    }
    
    int a = self.activities.selectedSegmentIndex;
    switch(a)
    {
        case 0:
            coeff+=0.0;
            break;
        case 1:
            coeff+=1.00/12;
            break;
        case 2:
            coeff+=1.50/12;
            break;
        case 3:
            coeff+=2.50/12;
            break;
        default:
            break;
    }
    
    int c = [self.cars.text intValue];
    coeff = coeff + c * (1.00/12);
    
    int b = self.bank.selectedSegmentIndex;
    switch(b)
    {
        case 0:
            coeff+=0.0;
            break;
        case 1:
            coeff+=0.40/12;
            break;
        default:
            break;
    }
    
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:coeff]];
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
}

- (void)stepperValueChanged:(id)sender
{
    self.cars.text = [NSString stringWithFormat:@"%.f", nbCars.value];
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
