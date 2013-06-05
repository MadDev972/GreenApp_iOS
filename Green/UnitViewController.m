//
//  UnitViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "UnitViewController.h"

@interface UnitViewController ()

@end

@implementation UnitViewController

@synthesize naturalGasUnit;
@synthesize heatingOilUnit;
@synthesize coalUnit;
@synthesize lpgUnit;
@synthesize mileageUnit;
@synthesize efficiencyUnit;
@synthesize fuelType;
@synthesize delegate;


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

- (void)dealloc
{

    NSString* ng = [self.naturalGasUnit titleForSegmentAtIndex:self.naturalGasUnit.selectedSegmentIndex];
    NSString* ho =[self.heatingOilUnit titleForSegmentAtIndex:self.heatingOilUnit.selectedSegmentIndex];
    NSString* c =[self.coalUnit titleForSegmentAtIndex:self.coalUnit.selectedSegmentIndex];
    NSString* l =[self.lpgUnit titleForSegmentAtIndex:self.lpgUnit.selectedSegmentIndex];
    NSString* mil =[self.mileageUnit titleForSegmentAtIndex:self.mileageUnit.selectedSegmentIndex];
    NSString* eff =[self.efficiencyUnit titleForSegmentAtIndex:self.efficiencyUnit.selectedSegmentIndex];
    NSString* ftype =[self.fuelType titleForSegmentAtIndex:self.fuelType.selectedSegmentIndex];
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    [retval addObject:ng];
    [retval addObject:ho];
    [retval addObject:c];
    [retval addObject:l];
    [retval addObject:mil];
    [retval addObject:eff];
    [retval addObject:ftype];

    [self.delegate addItemViewController:self didFinishEnteringItem:retval];
}

@end
