//
//  MediaTabBarController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/18/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "BooksTabBarController.h"
#import "BooksViewController.h"

@interface BooksTabBarController ()

@end

@implementation BooksTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    BooksViewController* bookController;
    
    if (item == [tabBar.items objectAtIndex:0])
    {
        bookController = [[self viewControllers] objectAtIndex:0];
        
        bookController.category = @"Buildings";
    }
    else if (item == [tabBar.items objectAtIndex:1])
    {
        bookController = [[self viewControllers] objectAtIndex:1];
        
        bookController.category = @"Education";
    }
    else if (item == [tabBar.items objectAtIndex:2])
    {
        bookController = [[self viewControllers] objectAtIndex:2];
        
        bookController.category = @"Economics";
    }
    else if (item == [tabBar.items objectAtIndex:3])
    {
        bookController = [[self viewControllers] objectAtIndex:3];
        
        bookController.category = @"Body & Mind";
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
