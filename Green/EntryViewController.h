//
//  EntryViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/16/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *factText;

-(IBAction)newFact:(id)sender;

@end
