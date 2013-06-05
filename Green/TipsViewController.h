//
//  TipsViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipsTabBarController.h"

@interface TipsViewController : UITableViewController

@property (nonatomic, strong) NSArray *Tips;
@property (nonatomic, copy) NSString *category;

@end
