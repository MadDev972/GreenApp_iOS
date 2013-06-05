//
//  AirTransportViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "AirTransportViewController.h"
#import "PersonalTrsprtViewController.h"
#import "DbHelper.h"
#import "Airport.h"
#import "EnergyViewController.h"
#import <math.h>



@interface AirTransportViewController ()

@end

@implementation AirTransportViewController
@synthesize airportsNames;

@synthesize _result;
@synthesize fromField = fromField;
@synthesize viaField = viaField;
@synthesize toField = toField;
@synthesize nbtrips = nbtrips;
@synthesize nbTrips = nbTrips;
@synthesize travelClass = travelClass;

@synthesize autocompleteAirports;
@synthesize autocompleteTableView;


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

    self.Airports = [[DbHelper database] Airports];
    
    self.airportsNames = [[NSMutableArray alloc] init];

    self.autocompleteAirports = [[NSMutableArray alloc] init];

    for (int i=0; i < [self.Airports count]; i++)
    {
        NSString * airport_name = [[self.Airports objectAtIndex:i] name];
        [self.airportsNames addObject:airport_name];
    }
    
    fromField.delegate = self;
    toField.delegate = self;
    viaField.delegate = self;
    
    autocompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 120) style:UITableViewStylePlain];
    autocompleteTableView.delegate = self;
    autocompleteTableView.dataSource = self;
    autocompleteTableView.scrollEnabled = YES;
    autocompleteTableView.hidden = YES;
    [self.view addSubview:autocompleteTableView];
    
    [self stepperValueChanged:self];
    
    NSLog(@"%@ %@", @"ARRAY = ", TotalCarbonFootprint);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"next"])
    {
        [self calculateAndSave];
        [TotalCarbonFootprint addObject:[NSNumber numberWithDouble:_result]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring
{
    [autocompleteAirports removeAllObjects];
    for(NSString *curString in airportsNames)
    {
        NSRange substringRange = [curString rangeOfString:substring options:NSCaseInsensitiveSearch];
        if (substringRange.location == 0)
        {
            [autocompleteAirports addObject:curString];
        }
    }
    [autocompleteTableView reloadData];
}

-(void)calculateAndSave
{
    float distance;
    
    NSString *fromLatitude;
    NSString *fromLongitude;
    NSString *viaLatitude;
    NSString *viaLongitude;
    NSString *toLatitude;
    NSString *toLongitude;
    
    NSString *from = fromField.text;
    NSString *via = viaField.text;
    NSString *to = toField.text;
    int nb = [nbTrips.text intValue];
    NSString *travelclass = [self.travelClass titleForSegmentAtIndex:self.travelClass.selectedSegmentIndex];

    for (int i=0; i<[self.Airports count]; i++)
    {
        Airport* _item = [self.Airports objectAtIndex:i];
        
        if ([_item.name isEqualToString:from])
        {
            fromLongitude = _item.longitude;
            fromLatitude = _item.latitude;
        }
        else if ([_item.name isEqualToString:via])
        {
            viaLongitude = _item.longitude;
            viaLatitude = _item.latitude;
        }
        else if ([_item.name isEqualToString:to])
        {
            toLongitude = _item.longitude;
            toLatitude = _item.latitude;
        }
    }
    
    NSArray *componentsFromLongitude = [fromLongitude componentsSeparatedByString:@":"];
    NSArray *componentsFromLatitude = [fromLatitude componentsSeparatedByString:@":"];
    NSArray *componentsToLongitude = [toLongitude componentsSeparatedByString:@":"];
    NSArray *componentsToLatitude = [toLongitude componentsSeparatedByString:@":"];
    
    //FROM Latitude and Longitude
    double LATITUDE_from = [[componentsFromLatitude objectAtIndex:0] doubleValue] + ([[componentsFromLatitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsFromLatitude objectAtIndex:2] doubleValue] * (1/3600));
    
    if ([[componentsFromLatitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsFromLatitude objectAtIndex:3] isEqualToString:@"W"])
        LATITUDE_from = -LATITUDE_from;
    
    
    double LONGITUDE_from = [[componentsFromLongitude objectAtIndex:0] doubleValue] + ([[componentsFromLongitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsFromLongitude objectAtIndex:2] doubleValue] * (1/3600));
    
    if ([[componentsFromLongitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsFromLongitude objectAtIndex:3] isEqualToString:@"W"])
        LONGITUDE_from = -LONGITUDE_from;
    
    
    
    //TO Latitude and Longitude
    double LATITUDE_to = [[componentsToLatitude objectAtIndex:0] doubleValue] + ([[componentsToLatitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsToLatitude objectAtIndex:2] doubleValue] * (1/3600));
    
    if ([[componentsToLatitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsToLatitude objectAtIndex:3] isEqualToString:@"W"])
        LATITUDE_to = -LATITUDE_to;
    
    
    double LONGITUDE_to = [[componentsToLongitude objectAtIndex:0] doubleValue] + ([[componentsToLongitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsToLongitude objectAtIndex:2] doubleValue] * (1/3600));
    
    if ([[componentsToLongitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsToLongitude objectAtIndex:3] isEqualToString:@"W"])
        LONGITUDE_to = -LONGITUDE_to;
    
    
    if([viaLongitude length] != 0)
    {
        NSArray *componentsViaLongitude = [viaLongitude componentsSeparatedByString:@":"];
        NSArray *componentsViaLatitude = [viaLatitude componentsSeparatedByString:@":"];
        
        double LATITUDE_via = [[componentsViaLatitude objectAtIndex:0] doubleValue] + ([[componentsViaLatitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsViaLatitude objectAtIndex:2] doubleValue] * (1/3600));
        
        if ([[componentsViaLatitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsViaLatitude objectAtIndex:3] isEqualToString:@"W"])
            LATITUDE_via = -LATITUDE_via;
        
        
        double LONGITUDE_via = [[componentsViaLongitude objectAtIndex:0] doubleValue] + ([[componentsViaLongitude objectAtIndex:1] doubleValue] * (1/60)) + ([[componentsViaLongitude objectAtIndex:2] doubleValue] * (1/3600));
        
        if ([[componentsViaLongitude objectAtIndex:3] isEqualToString:@"S"] || [[componentsViaLongitude objectAtIndex:3] isEqualToString:@"W"])
            LONGITUDE_via = -LONGITUDE_via;
        
        
        //Total flown distance
        double dLat1 = (LATITUDE_via-LATITUDE_from)*(M_PI/180);
        double dLat2 = (LATITUDE_to-LATITUDE_via)*(M_PI/180);
        double Lat1 = LATITUDE_from*(M_PI/180);
        double Lat2 = LATITUDE_via*(M_PI/180);
        double Lat3 = LATITUDE_to*(M_PI/180);
        double dLong1 = (LONGITUDE_via-LONGITUDE_from)*(M_PI/180);
        double dLong2 = (LONGITUDE_to-LONGITUDE_via)*(M_PI/180);
        
        double a1 = sin(dLat1/2)*sin(dLat1/2)
        + sin(dLong1/2)*sin(dLong1/2)
        * cos(Lat1)*cos(Lat2);
        
        double a2 = sin(dLat2/2)*sin(dLat2/2)
        + sin(dLong2/2)* sin(dLong2/2)
        * cos(Lat2)* cos(Lat3);
        
        float distance1 =  (6371*2*atan2(sqrt(a1), sqrt(1-a1)));
        distance =  distance1 + (6371*2*atan2(sqrt(a2), sqrt(1-a2)));
        
    }
    else
    {
        double dLat = (LATITUDE_to-LATITUDE_from)*(M_PI/180);
        double Lat1 = LATITUDE_from*(M_PI/180);
        double Lat2 = LATITUDE_to*(M_PI/180);
        double dLong = (LONGITUDE_to-LONGITUDE_from)*(M_PI/180);
        
        double a = sin(dLat/2)*sin(dLat/2)
        + sin(dLong/2) * sin(dLong/2)
        * cos(Lat1) * cos(Lat2);
    
        distance = (6371*2*atan2(sqrt(a), sqrt(1-a)));
    }
    
    

    float coeff;
    
    if([travelclass isEqualToString:@"Economy class"])
    {
        if(distance<=463)
        {
            coeff= 0.20515;
        }
        else if(distance<=1108)
        {
            coeff = 0.11054;
        }
        else
        {
            coeff = 0.09881;
        }
    }
    else if([travelclass isEqualToString:@"Premium Economy class"])
    {
        if(distance<=463)
        {
            coeff= 0.20515;
        }
        else if(distance<=1108)
        {
            coeff = 0.11600;
        }
        else
        {
            coeff = 0.15809;
        }
    }
    else if([travelclass isEqualToString:@"Business class"])
    {
        if(distance<=463)
        {
            coeff= 0.20515;
        }
        else if(distance<=1108)
        {
            coeff = 0.16581;
        }
        else
        {
            coeff = 0.28654;
        }
    }
    else
    {
        if(distance<=463)
        {
            coeff= 0.20515;
        }
        else if(distance<=1108)
        {
            coeff = 0.16581;
        }
        else
        {
            coeff = 0.39523;
        }
    }
    
    self._result = self._result + nb * distance * coeff;    
}

- (IBAction)stepperValueChanged:(id)sender
{
    self.nbTrips.text = [NSString stringWithFormat:@"%.f", nbtrips.value];
}

- (IBAction)addNewFlight:(id)sender
{
    [self calculateAndSave];
    self.fromField.text = @"";
    self.viaField.text = @"";
    self.toField.text = @"";
    self.nbtrips.value = 1;
    self.nbTrips.text = @"1";
    
    [self viewWillAppear:YES];
}

#pragma mark UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField == fromField)
        _field=1;
    else if(textField == viaField)
        _field=2;
    else if (textField == toField)
        _field=3;
        
    autocompleteTableView.hidden = NO;
    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
            
    return YES;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return autocompleteAirports.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
    }
    
    cell.textLabel.text = [autocompleteAirports objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        
    autocompleteTableView.hidden = YES;
    
    switch(_field)
    {
        case 1:
            fromField.text = selectedCell.textLabel.text;
            [fromField resignFirstResponder];
            break;
            
        case 2:
            viaField.text = selectedCell.textLabel.text;
            [viaField resignFirstResponder];
            break;
        case 3:
            toField.text = selectedCell.textLabel.text;
            [toField resignFirstResponder];
            break;
    }
}

@end
