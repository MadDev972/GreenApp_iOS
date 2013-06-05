//
//  CombitechOffersViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/25/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "CombitechOffersViewController.h"
#import "DbHelper.h"
#import "Offer.h"


@interface CombitechOffersViewController ()

@end

@implementation CombitechOffersViewController

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

    self.Offers = [[DbHelper database] Offers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Offers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OfferCell"];
	Offer *_offer = [self.Offers objectAtIndex:indexPath.row];
    
    UILabel * title = (UILabel *) [cell viewWithTag:70];
    title.text = _offer.name;
    
    UILabel *d1 = (UILabel *) [cell viewWithTag:71];
    d1.text = _offer.detail1;
    
    UILabel *d2 = (UILabel *) [cell viewWithTag:72];
    d2.text = _offer.detail2;
    
    UILabel *d3 = (UILabel *) [cell viewWithTag:73];
    d3.text = _offer.detail3;
    
    UILabel *d4 = (UILabel *) [cell viewWithTag:74];
    d4.text = _offer.detail4;

    
    return cell;
}

@end
