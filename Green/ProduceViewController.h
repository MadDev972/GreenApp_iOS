//
//  ProduceViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProduceViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *organic;
@property (strong, nonatomic) IBOutlet UISegmentedControl *season;
@property (strong, nonatomic) IBOutlet UISegmentedControl *local;

-(IBAction)calculateAndSave:(id)sender;

@end
