//
//  EnergyViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitViewController.h"

NSMutableArray *TotalCarbonFootprint;

@interface EnergyViewController : UIViewController <UnitViewControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField *to_correct;
}

@property (strong, nonatomic) IBOutlet UITextField *pplNb;
@property (strong, nonatomic) IBOutlet UITextField *timeLength;

@property (strong, nonatomic) IBOutlet UITextField *elNb;
@property (strong, nonatomic) IBOutlet UITextField *ngNb;
@property (strong, nonatomic) IBOutlet UITextField *hoNb;
@property (strong, nonatomic) IBOutlet UITextField *cNb;
@property (strong, nonatomic) IBOutlet UITextField *lpgNb;
@property (strong, nonatomic) IBOutlet UITextField *wpNb;


@property (strong, nonatomic) IBOutlet UILabel *ngUnit;
@property (strong, nonatomic) IBOutlet UILabel *hoUnit;
@property (strong, nonatomic) IBOutlet UILabel *cUnit;
@property (strong, nonatomic) IBOutlet UILabel *lpgUnit;

-(IBAction)calculateAndSave:(id)sender;

@end
