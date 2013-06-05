//
//  FoodPreferencesViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodPreferencesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *foodType;

- (IBAction)sliderChanged:(id)sender;
-(IBAction)calculateAndSave:(id)sender;

@end
