//
//  PublicTrsprtViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "PublicTrsprtViewController.h"
#import "EnergyViewController.h"


@interface PublicTrsprtViewController ()

@end

@implementation PublicTrsprtViewController
@synthesize busMileage;
@synthesize busMileageUnit;
@synthesize trainLocalMileage;
@synthesize trainLocalMileageUnit;
@synthesize trainLongMileage;
@synthesize trainLongMileageUnit;
@synthesize tramMileage;
@synthesize tramMileageUnit;
@synthesize subwayMileage;
@synthesize subwayMileageUnit;
@synthesize taxiMileage;
@synthesize taxiMileageUnit;


- (void)addItemViewController:(UnitViewController *)controller didFinishEnteringItem:(NSArray *)item
{
    self.busMileageUnit.text = [item objectAtIndex:4];
    self.trainLocalMileageUnit.text = [item objectAtIndex:4];
    self.trainLongMileageUnit.text = [item objectAtIndex:4];
    self.tramMileageUnit.text = [item objectAtIndex:4];
    self.subwayMileageUnit.text = [item objectAtIndex:4];
    self.taxiMileageUnit.text = [item objectAtIndex:4];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showUnits"])
        [[segue destinationViewController] setDelegate:self];
}

-(void)calculateAndSave:(id)sender
{
    double _result;
    
    //BUS
    
    double M = [self.busMileage.text doubleValue];
        
    double fuelCoeff = [self getCarbonCoeffForVehicle:@"Bus" MileageUnit:self.busMileageUnit.text];
    
    _result = fuelCoeff*M;
    
    
    //LOCAL TRAIN
    
    M = [self.trainLocalMileage.text doubleValue];
    
    fuelCoeff = [self getCarbonCoeffForVehicle:@"LocalTrain" MileageUnit:self.trainLocalMileageUnit.text];
    
    _result += fuelCoeff*M;

    
    //TRAIN
    
    M = [self.trainLongMileage.text doubleValue];
    
    fuelCoeff = [self getCarbonCoeffForVehicle:@"Train" MileageUnit:self.trainLongMileageUnit.text];
    
    _result += fuelCoeff*M;

    
    //TRAM
    
    M = [self.tramMileage.text doubleValue];
    
    fuelCoeff = [self getCarbonCoeffForVehicle:@"Tram" MileageUnit:self.tramMileageUnit.text];
    
    _result += fuelCoeff*M;

    
    //SUBWAY
    
    M = [self.subwayMileage.text doubleValue];
    
    fuelCoeff = [self getCarbonCoeffForVehicle:@"Subway" MileageUnit:self.subwayMileageUnit.text];
    
    _result += fuelCoeff*M;
    NSLog(@"%@ %f", @"COEFF =", fuelCoeff);

    //TAXI
    
    M = [self.taxiMileage.text doubleValue];
    
    fuelCoeff = [self getCarbonCoeffForVehicle:@"Taxi" MileageUnit:self.taxiMileageUnit.text];
    
    _result += fuelCoeff*M;
    
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:_result]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];

    busMileage.delegate = self;
    trainLocalMileage.delegate = self;
    trainLongMileage.delegate = self;
    tramMileage.delegate = self;
    subwayMileage.delegate = self;
    taxiMileage.delegate = self;
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double)getCarbonCoeffForVehicle:(NSString *)vehicle MileageUnit:(NSString *)unit
{
    if([vehicle isEqualToString:@"Bus"] || [vehicle isEqualToString:@"LocalTrain"])
    {
        if([unit isEqualToString:@"km"])
            return 0.16084;
        else
            return 0.16084*1.609344;
    }
    else if([vehicle isEqualToString:@"Train"])
    {
        if([unit isEqualToString:@"km"])
            return 0.06510;
        else
            return 0.06510*1.609344;
    }
    else if([vehicle isEqualToString:@"Tram"])
    {
        if([unit isEqualToString:@"km"])
            return 0.08761;
        else
            return 0.08761*1.609344;
    }
    else if([vehicle isEqualToString:@"Subway"])
    {
        if([unit isEqualToString:@"km"])
            return 0.08457;
        else
            return 0.08457*1.609344;
    }
    else if ([vehicle isEqualToString:@"Taxi"])
    {
        if([unit isEqualToString:@"km"])
            return 0.18274;
        else
            return 0.18274*1.609344;
    }
return -1;
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSString *text = [to_correct.text substringToIndex:[to_correct.text length]-1];
        
        if(to_correct == busMileage)
            busMileage.text = text;
        else if(to_correct == trainLocalMileage)
            trainLocalMileage.text = text;
        else if (to_correct == trainLongMileage)
            trainLongMileage.text = text;
        else if (to_correct == tramMileage)
            tramMileage.text = text;
        else if(to_correct == subwayMileage)
            subwayMileage.text = text;
        else if (to_correct == taxiMileage)
            taxiMileage.text = text;
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
