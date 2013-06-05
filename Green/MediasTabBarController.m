//
//  MediasTabBarController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/18/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "MediasTabBarController.h"
#import "MediasViewController.h"

@interface MediasTabBarController ()

@end

@implementation MediasTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    MediasViewController* bookController;
    
    if (item == [tabBar.items objectAtIndex:0])
    {
        bookController = [[self viewControllers] objectAtIndex:0];
        
        bookController.category = @"Documentary";
    }
    else if (item == [tabBar.items objectAtIndex:1])
    {
        bookController = [[self viewControllers] objectAtIndex:1];
        
        bookController.category = @"Fiction";
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
