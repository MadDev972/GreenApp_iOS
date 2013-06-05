//
//  QuizzTabBarController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/19/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizzesTabBarController : UITabBarController <UITabBarDelegate>

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end
