//
//  TipsViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "TipsViewController.h"
#import "DbHelper.h"

@interface TipsViewController ()

@end

@implementation TipsViewController
@synthesize category;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];
 
    if([self.category length] == 0)
        self.category = @"Food";
    
    self.Tips = [[DbHelper database] FactsInCategory:self.category];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Tips count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell"];
	NSString *tip = [self.Tips objectAtIndex:indexPath.row];
    UITextView * tipText = (UITextView *) [cell viewWithTag:10];
    tipText.text = tip;
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
