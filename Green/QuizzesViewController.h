//
//  QuizzesViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizzItem.h"


@interface QuizzesViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *questionText;
@property (strong, nonatomic) IBOutlet UILabel *choice1Text;
@property (strong, nonatomic) IBOutlet UILabel *choice2Text;
@property (strong, nonatomic) IBOutlet UILabel *choice3Text;
@property (strong, nonatomic) IBOutlet UILabel *choice4Text;

@property (strong, nonatomic) IBOutlet UIButton *choice3Button;
@property (strong, nonatomic) IBOutlet UIButton *choice4Button;



@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSArray *QuizzItems;
@property (nonatomic, strong) QuizzItem * _currentItem;

-(IBAction)getAnswer:(id)sender;
-(QuizzItem *)randomItem;

@end
