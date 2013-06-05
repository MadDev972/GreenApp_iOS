//
//  TotalCarbonFootprintViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "TotalCarbonFootprintViewController.h"
#import "EnergyViewController.h"


@interface TotalCarbonFootprintViewController ()

@end

@implementation TotalCarbonFootprintViewController
@synthesize house;
@synthesize air;
@synthesize privateTravel;
@synthesize publicTravel;
@synthesize secondary;
@synthesize total;


-(void)calculateTotal
{
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setMaximumFractionDigits:2];
    
    int s = 0;
    
    double t = [[TotalCarbonFootprint objectAtIndex:1] doubleValue];
    self.house.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t]];
    
    s+=t/1000;
    
    t= [[TotalCarbonFootprint objectAtIndex:2] doubleValue];
    self.air.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t]];
    
    s+=t/1000;
    
    t=[[TotalCarbonFootprint objectAtIndex:3] doubleValue];
    self.privateTravel.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t]];
    
    s+=t/1000;
    
    t=[[TotalCarbonFootprint objectAtIndex:4] doubleValue];
    self.publicTravel.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t]];

    s+=t/1000;
    
    t = [[TotalCarbonFootprint objectAtIndex:5] doubleValue]
           +[[TotalCarbonFootprint objectAtIndex:6] doubleValue]
           +[[TotalCarbonFootprint objectAtIndex:7] doubleValue]
           +[[TotalCarbonFootprint objectAtIndex:8] doubleValue]
           /[[TotalCarbonFootprint objectAtIndex:0] doubleValue];
    self.secondary.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t]];            
   
    self.total.text = [fmt stringFromNumber:[NSNumber numberWithDouble:t+s]];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];

    [self calculateTotal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
