//
//  PersonalTrsprtViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "PersonalTrsprtViewController.h"
#import "PublicTrsprtViewController.h"
#import "EnergyViewController.h"


@interface PersonalTrsprtViewController ()

@end

@implementation PersonalTrsprtViewController
@synthesize carMileage;
@synthesize carMileageUnit;
@synthesize carEfficiency;
@synthesize carEfficiencyUnit;
@synthesize carFuel;
@synthesize motoMileage;
@synthesize motoMileageUnit;
@synthesize motoEfficiency;
@synthesize motoEfficiencyUnit;
@synthesize motoFuel;


- (void)addItemViewController:(UnitViewController *)controller didFinishEnteringItem:(NSArray *)item
{
    self.carMileageUnit.text = [item objectAtIndex:4];
    self.motoMileageUnit.text = [item objectAtIndex:4];

    self.carEfficiencyUnit.text = [item objectAtIndex:5];
    self.motoEfficiencyUnit.text = [item objectAtIndex:5];
    
    self.carFuel.text = [item objectAtIndex:6];
    self.motoFuel.text = [item objectAtIndex:6];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showUnits"])
        [[segue destinationViewController] setDelegate:self];
}

-(void)calculateAndSave:(id)sender
{
    //CAR    
    
    double M = [self.carMileage.text doubleValue];
    
    double E = [self.carEfficiency.text doubleValue];

    M = [self getLiterConsumptionFromMileage:M MileageUnit:self.carMileageUnit.text Efficiency:E EfficiencyUnit:self.carEfficiencyUnit.text];
    
    double fuelCoeff = [self getFuelCoeff:self.carFuel.text];
    
    M=fuelCoeff*M;
    
    
    //MOTOCYCLE
    
    double m = [self.motoMileage.text doubleValue];
    
    E = [self.motoEfficiency.text doubleValue];
    
    m = [self getLiterConsumptionFromMileage:m MileageUnit:self.motoMileageUnit.text Efficiency:E EfficiencyUnit:self.motoEfficiencyUnit.text];
        
    fuelCoeff = [self getFuelCoeff:self.motoFuel.text];
    
    //SUM TOTAL
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:M + fuelCoeff*m]];
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

    carMileage.delegate = self;
    carEfficiency.delegate = self;
    motoMileage.delegate = self;
    motoEfficiency.delegate = self;
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double)getFuelCoeff:(NSString *)fuel
{
    if([fuel isEqualToString:@"petrol"])
    {
        return 2.7329;
    }
    else if([fuel isEqualToString:@"diesel"])
    {
        return 3.1787;
    }
    else if([fuel isEqualToString:@"LPG"])
    {
        return 1.6786;
    }
    else if([fuel isEqualToString:@"LNG/CNG"])
    {
        return 0.00261;
    }
    else if([fuel isEqualToString:@"Biodiesel"])
    {
        return 2.493;
    }
    else if([fuel isEqualToString:@"Bioethanol"])
    {
        return 1.5236;
    }
    else if([fuel isEqualToString:@"Biomethane"])
    {
        return 0.002;
    }

    return -1;
}

-(double) getLiterConsumptionFromMileage:(double)m MileageUnit:(NSString *)mUnit Efficiency:(double)e EfficiencyUnit:(NSString *)eUnit
{
    if([mUnit isEqualToString:@"km"])
    {
        if([eUnit isEqualToString:@"L/100"])
            return (m*e)/100;
        else if([eUnit isEqualToString:@"g(uk)/km"])
            return (m*e)*4.54609;
        else if([eUnit isEqualToString:@"g(us)/km"])
            return (m*e)*3.78541;
    }
    else if([mUnit isEqualToString:@"miles"])
    {
        if([eUnit isEqualToString:@"g(uk)/miles"])
            m = (m*e)*4.54609;
        else if([eUnit isEqualToString:@"g(us)/miles"])
            m = (m*e)*3.78541;
    }

    return -1;
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSString *text = [to_correct.text substringToIndex:[to_correct.text length]-1];
        
        if(to_correct == carMileage)
            carMileage.text = text;
        else if(to_correct == carEfficiency)
            carEfficiency.text = text;
        else if (to_correct == motoMileage)
            motoMileage.text = text;
        else if (to_correct == motoEfficiency)
            motoEfficiency.text = text;
    }
}

#pragma mark UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        return FALSE;
    }
    else if( ![[NSScanner scannerWithString:string] scanFloat:NULL] && [textField.text length] < [string length])
    {
        to_correct = textField;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong data type"
                                                        message:@"Numeric data is expected here"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        alert.backgroundColor=[UIColor greenColor];
        [alert show];
    }
    
    return YES;
}

@end
