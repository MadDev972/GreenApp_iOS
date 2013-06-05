//
//  UnitViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UnitViewController;

@protocol UnitViewControllerDelegate <NSObject>
- (void)addItemViewController:(UnitViewController *)controller didFinishEnteringItem:(NSArray *)item;
@end

@interface UnitViewController : UIViewController

@property (nonatomic, weak) id <UnitViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UISegmentedControl *naturalGasUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *heatingOilUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *coalUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *lpgUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mileageUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *efficiencyUnit;
@property (strong, nonatomic) IBOutlet UISegmentedControl *fuelType;

@end
