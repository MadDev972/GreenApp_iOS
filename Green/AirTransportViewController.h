//
//  AirTransportViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirTransportViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    IBOutlet UITextField *fromField;
    IBOutlet UITextField *viaField;
    IBOutlet UITextField *toField;
    
    IBOutlet UISegmentedControl *travelClass;
    
    IBOutlet UIStepper *nbtrips;
    IBOutlet UILabel *nbTrips;
    
    double _result; int _field;
    NSMutableArray *airportsNames;
    NSMutableArray *autocompleteAirports;
    UITableView *autocompleteTableView;
}


@property (nonatomic, assign) double _result;
@property (nonatomic, strong) NSArray *Airports;

@property (nonatomic, retain) UITextField *fromField;
@property (nonatomic, retain) UITextField *viaField;
@property (nonatomic, retain) UITextField *toField;
@property (nonatomic, retain) UISegmentedControl *travelClass;
@property (nonatomic, retain) UIStepper *nbtrips;
@property (nonatomic, retain) UILabel *nbTrips;


@property (nonatomic, retain) NSMutableArray *airportsNames;
@property (nonatomic, retain) NSMutableArray *autocompleteAirports;
@property (nonatomic, retain) UITableView *autocompleteTableView;


- (IBAction)stepperValueChanged:(id)sender;
- (IBAction)addNewFlight:(id)sender;

@end
