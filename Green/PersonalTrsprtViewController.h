//
//  PersonalTrsprtViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitViewController.h"


@interface PersonalTrsprtViewController : UIViewController <UnitViewControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField *to_correct;
}


@property (strong, nonatomic) IBOutlet UITextField *carMileage;
@property (strong, nonatomic) IBOutlet UITextField *carEfficiency;
@property (strong, nonatomic) IBOutlet UITextField *motoMileage;
@property (strong, nonatomic) IBOutlet UITextField *motoEfficiency;


@property (strong, nonatomic) IBOutlet UILabel *carMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *carEfficiencyUnit;
@property (strong, nonatomic) IBOutlet UILabel *carFuel;
@property (strong, nonatomic) IBOutlet UILabel *motoMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *motoEfficiencyUnit;
@property (strong, nonatomic) IBOutlet UILabel *motoFuel;

-(IBAction)calculateAndSave:(id)sender;

@end
