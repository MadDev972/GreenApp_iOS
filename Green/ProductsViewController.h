//
//  ProductsViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/24/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *package;
@property (strong, nonatomic) IBOutlet UISegmentedControl *furniture;
@property (strong, nonatomic) IBOutlet UISegmentedControl *recycle;

-(IBAction)calculateAndSave:(id)sender;

@end
