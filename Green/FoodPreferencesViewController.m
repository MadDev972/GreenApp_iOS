//
//  FoodPreferencesViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "FoodPreferencesViewController.h"
#import "EnergyViewController.h"


@interface FoodPreferencesViewController ()

@end

@implementation FoodPreferencesViewController

@synthesize foodType;


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
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.foodType setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.foodType setThumbImage:thumbImageHighlighted forState: UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.foodType setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.foodType setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateAndSave:(id)sender
{
    int type = [foodType value];
    
    if(type == 0)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0]];
    else if(type == 1)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0.14/12]];
    else if (type == 2)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0.28/12]];
    else if(type == 3)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0.42/12]];
    else if (type == 4)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0.56/12]];
    else if(type == 5)
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:0.7/12]];
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
}

- (void)sliderChanged:(id)sender
{
    NSLog(@"%@ %f", @"VALUE =", foodType.value);
    NSLog(@"%@ %ld", @"VALUE ARRONDIE =", lroundf(foodType.value));
    
    [foodType setValue:lroundf(foodType.value) animated:YES];
}

@end
