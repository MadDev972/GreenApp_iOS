//
//  TotalCarbonFootprintViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalCarbonFootprintViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *house;
@property (strong, nonatomic) IBOutlet UILabel *air;
@property (strong, nonatomic) IBOutlet UILabel *privateTravel;
@property (strong, nonatomic) IBOutlet UILabel *publicTravel;
@property (strong, nonatomic) IBOutlet UILabel *secondary;
@property (strong, nonatomic) IBOutlet UILabel *total;

-(void)calculateTotal;

@end
