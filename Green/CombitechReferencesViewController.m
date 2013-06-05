//
//  CombitechReferencesViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "CombitechReferencesViewController.h"
#import "DetailsViewController.h"
#import "DbHelper.h"
#import "Reference.h"


@interface CombitechReferencesViewController ()

@end

@implementation CombitechReferencesViewController
@synthesize References;


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Reference *_ref = [self.References objectAtIndex:indexPath.row];
        
        DetailsViewController *detailViewController = [segue destinationViewController];
        detailViewController.description = _ref.description;
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    self.References = [[DbHelper database] References];
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
    return [self.References count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReferenceCell"];
	Reference *ref = [self.References objectAtIndex:indexPath.row];
	cell.textLabel.text = ref.name;
    return cell;
}

@end
