//
//  EnergyViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "EnergyViewController.h"
#import "AirTransportViewController.h"


@interface EnergyViewController ()

@end

@implementation EnergyViewController

@synthesize pplNb;
@synthesize timeLength;
@synthesize elNb;
@synthesize ngNb;
@synthesize hoNb;
@synthesize cNb;
@synthesize lpgNb;
@synthesize wpNb;
@synthesize ngUnit;
@synthesize hoUnit;
@synthesize cUnit;
@synthesize lpgUnit;

- (void)addItemViewController:(UnitViewController *)controller didFinishEnteringItem:(NSArray *)item
{    
    self.ngUnit.text = [item objectAtIndex:0];
    self.hoUnit.text = [item objectAtIndex:1];
    self.cUnit.text = [item objectAtIndex:2];
    self.lpgUnit.text = [item objectAtIndex:3];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showUnits"])
        [[segue destinationViewController] setDelegate:self];
}

-(void)calculateAndSave:(id)sender
{
    double t = [self.timeLength.text doubleValue];
    double ppl = [self.pplNb.text doubleValue];
    
    double el = [[[NSString alloc] initWithString:self.elNb.text] doubleValue];
    el *= 0.61707;
    
    double ng = [[[NSString alloc] initWithString:self.ngNb.text] doubleValue];
    if([self.ngUnit.text isEqualToString:@"kWh"])
        ng *= 0.22554;
    else if([self.ngUnit.text isEqualToString:@"therms"])
        ng *= 6.61004;
    else if([self.ngUnit.text isEqualToString:@"m3"])
        ng *= 2.224;
             
    double ho = [[[NSString alloc] initWithString:self.hoNb.text] doubleValue];
    if([self.hoUnit.text isEqualToString:@"kWh"])
        ho *= 0.30786;
     else if([self.hoUnit.text isEqualToString:@"litres"])
        ho *= 3.0121;
     else if([self.hoUnit.text isEqualToString:@"tonnes"])
        ho *= 3750.1;
     else if([self.hoUnit.text isEqualToString:@"gal(us)"])
        ho *= 11.4008;
     else if([self.hoUnit.text isEqualToString:@"gal(uk)"])
        ho*=13.6930;
        
        
    double coal = [[[NSString alloc] initWithString:self.cNb.text] doubleValue];
    if([self.cUnit.text isEqualToString:@"kWh"])
        coal*= 0.41342;
    else if([self.cUnit.text isEqualToString:@"t"])
        coal*=3327.5;
        
    
    double lpg = [[[NSString alloc] initWithString:self.lpgNb.text] doubleValue];
    if([self.lpgUnit.text isEqualToString:@"kWh"])
        lpg *= 0.25907;
    else if([self.lpgUnit.text isEqualToString:@"therms"])
        lpg *= 7.59255;
    else if([self.lpgUnit.text isEqualToString:@"litres"])
        lpg *= 1.6786;
    
    
    double wPellets = [[[NSString alloc] initWithString:self.wpNb.text] doubleValue];
    wPellets *= 183.93;
    
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:t]];
    [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:(el + ng + ho + coal + lpg +wPellets) / ppl]];
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

    TotalCarbonFootprint = [[NSMutableArray alloc] init];
    
    pplNb.delegate = self;
    timeLength.delegate = self;
    elNb.delegate = self;
    ngNb.delegate = self;
    hoNb.delegate = self;
    cNb.delegate = self;
    lpgNb.delegate = self;
    wpNb.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSString *text = [to_correct.text substringToIndex:[to_correct.text length]-1];
        
        if(to_correct == pplNb)
            pplNb.text = text;
        else if(to_correct == timeLength)
            timeLength.text = text;
        else if (to_correct == elNb)
            elNb.text = text;
        else if (to_correct == ngNb)
            ngNb.text = text;
        else if(to_correct == hoNb)
            hoNb.text = text;
        else if(to_correct == cNb)
            cNb.text = text;
        else if(to_correct == lpgNb)
            lpgNb.text = text;
        else if (to_correct == wpNb)
            wpNb.text = text;
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
