//
//  TipsTabBarControllerViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/18/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "TipsTabBarController.h"
#import "TipsViewController.h"

@interface TipsTabBarController ()

@end

@implementation TipsTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    TipsViewController* tipsController;
    
    if (item == [tabBar.items objectAtIndex:0])
    {        
        tipsController = [[self viewControllers] objectAtIndex:0];
        
        tipsController.category = @"Food";
    }
    else if (item == [tabBar.items objectAtIndex:1])
    {
        tipsController = [[self viewControllers] objectAtIndex:1];

        tipsController.category = @"Home and Garden";
    }
    else if (item == [tabBar.items objectAtIndex:2])
    {
        tipsController = [[self viewControllers] objectAtIndex:2];

        tipsController.category = @"Travel and Transportation";
    }
    else if (item == [tabBar.items objectAtIndex:3])
    {
        tipsController = [[self viewControllers] objectAtIndex:3];

        tipsController.category = @"Resources";
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
