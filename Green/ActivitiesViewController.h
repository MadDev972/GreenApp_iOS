//
//  ProductsViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivitiesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *shop;
@property (strong, nonatomic) IBOutlet UISegmentedControl *activities;
@property (strong, nonatomic) IBOutlet UILabel *cars;
@property (strong, nonatomic) IBOutlet UIStepper *nbCars;
@property (strong, nonatomic) IBOutlet UISegmentedControl *bank;


- (IBAction)stepperValueChanged:(id)sender;
-(IBAction)calculateAndSave:(id)sender;

@end
