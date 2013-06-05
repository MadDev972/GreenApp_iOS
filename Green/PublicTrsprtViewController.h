//
//  PublicTrsprtViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitViewController.h"


@interface PublicTrsprtViewController : UIViewController <UnitViewControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField *to_correct;
}



@property (strong, nonatomic) IBOutlet UITextField *busMileage;
@property (strong, nonatomic) IBOutlet UITextField *trainLocalMileage;
@property (strong, nonatomic) IBOutlet UITextField *trainLongMileage;
@property (strong, nonatomic) IBOutlet UITextField *tramMileage;
@property (strong, nonatomic) IBOutlet UITextField *subwayMileage;
@property (strong, nonatomic) IBOutlet UITextField *taxiMileage;


@property (strong, nonatomic) IBOutlet UILabel *busMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *trainLocalMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *trainLongMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *tramMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *subwayMileageUnit;
@property (strong, nonatomic) IBOutlet UILabel *taxiMileageUnit;

-(IBAction)calculateAndSave:(id)sender;

@end
