//
//  QuizzTabBarController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/19/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "QuizzesTabBarController.h"
#import "QuizzesViewController.h"

@interface QuizzesTabBarController ()

@end

@implementation QuizzesTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    QuizzesViewController* quizzController;
    
    if (item == [tabBar.items objectAtIndex:0])
    {
        quizzController = [[self viewControllers] objectAtIndex:0];
        
        quizzController.category = @"Food";
    }
    else if (item == [tabBar.items objectAtIndex:1])
    {
        quizzController = [[self viewControllers] objectAtIndex:1];
        
        quizzController.category = @"Home and Garden";
    }
    else if (item == [tabBar.items objectAtIndex:2])
    {
        quizzController = [[self viewControllers] objectAtIndex:2];
        
        quizzController.category = @"Travel and Transportation";
    }
    else if (item == [tabBar.items objectAtIndex:3])
    {
        quizzController = [[self viewControllers] objectAtIndex:3];
        
        quizzController.category = @"Resources";
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.tabBar.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
