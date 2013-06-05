//
//  QuizzesViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/22/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "QuizzesViewController.h"
#import "DbHelper.h"

@interface QuizzesViewController ()

@end

@implementation QuizzesViewController

@synthesize questionText;
@synthesize choice1Text;
@synthesize choice2Text;
@synthesize choice3Text;
@synthesize choice4Text;
@synthesize choice3Button;
@synthesize choice4Button;
@synthesize _currentItem;


-(QuizzItem *)randomItem
{    
    int r = arc4random() % ([self.QuizzItems count]);
    
    return [self.QuizzItems objectAtIndex: r];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
        [self newQuizzItem:self];
}

-(void)newQuizzItem:(id)sender
{
    
    _currentItem = [self randomItem];
    
    self.questionText.text = _currentItem.question;
    
    self.choice1Text.text = _currentItem.choice1;
    
    self.choice2Text.text = _currentItem.choice2;
    
    if (![_currentItem.choice3 isEqualToString:@""])
    {
        self.choice3Text.text = _currentItem.choice3;
        self.choice3Button.hidden = NO;
        self.choice3Text.hidden = NO;
    }
    
    if (![_currentItem.choice4 isEqualToString:@""])
    {
        self.choice4Text.text = _currentItem.choice4;
        self.choice4Button.hidden = NO;
        self.choice4Text.hidden = NO;
    }
}

-(void)sendAnswer:(bool)correct
{
    self.choice3Text.hidden = YES;
    self.choice4Text.hidden = YES;
    self.choice3Button.hidden = YES;
    self.choice4Button.hidden = YES;
    
    NSMutableString *msg = [NSMutableString string];
    
    NSString *title;

    if(correct)
    {
        title = @"Congrats !";
        
        [msg appendString:@"You answered correctly !"];
        [msg appendString:_currentItem.comment];
    }
    else
    {
        title = @"Sorry !";
        
        [msg appendString:@"You answered wrong...The correct answer was "];
        [msg appendString:_currentItem.answer];
        [msg appendString:@". "];
        [msg appendString:_currentItem.comment];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    alert.backgroundColor=[UIColor greenColor];
    [alert show];
}


-(void)getAnswer:(id)sender
{
    switch ( [sender tag] )
    {
        case 1:
            if ([_currentItem.answer isEqualToString:_currentItem.choice1])
                [self sendAnswer:YES];
            else
                [self sendAnswer:NO];
            break;
            
        case 2:
            if ([_currentItem.answer isEqualToString:_currentItem.choice2])
                [self sendAnswer:YES];
            else
                [self sendAnswer:NO];
            break;

        case 3:
            if ([_currentItem.answer isEqualToString:_currentItem.choice3])
                [self sendAnswer:YES];
            else
                [self sendAnswer:NO];
            break;

        case 4:
            if ([_currentItem.answer isEqualToString:_currentItem.choice4])
                [self sendAnswer:YES];
            else
                [self sendAnswer:NO];
            break;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];

    if ([self.category length] == 0)
        self.category = @"Food";
    
    self.QuizzItems = [[DbHelper database] QuizzesInCategory:self.category];
            
    [self newQuizzItem:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
