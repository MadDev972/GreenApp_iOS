//
//  BookInfoViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/17/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "BooksViewController.h"
#import "DetailsViewController.h"
#import "DbHelper.h"
#import "Book.h"

@interface BooksViewController ()

@end

@implementation BooksViewController
@synthesize category;


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *_book = [self.Books objectAtIndex:indexPath.row];
        
        DetailsViewController *detailViewController = [segue destinationViewController];
        detailViewController.image = _book.image;
        detailViewController.description = _book.description;
        
        NSMutableString *i = [[NSMutableString alloc] initWithString:@"ISBN "];
        [i appendString:_book.isbn];
        detailViewController.isbn = i;
        
        detailViewController.hideISBN = NO;
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

    if ([self.category length] == 0)
        self.category = @"Buildings";
        
    self.Books = [[DbHelper database] BooksInCategory:self.category];
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
    return [self.Books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
	Book *_book = [self.Books objectAtIndex:indexPath.row];
    
    UILabel * title = (UILabel *) [cell viewWithTag:20];
    title.text = _book.title;
    
    UILabel *subtitle = (UILabel *) [cell viewWithTag:21];
    subtitle.text = _book.subtitle;
    
    UILabel *author = (UILabel *) [cell viewWithTag:22];
    author.text = _book.author;
    
    UIImageView * coverImageView = (UIImageView *) [cell viewWithTag:23];
    UIImage *cover = [UIImage imageNamed:_book.image];
    
	coverImageView.image = cover;
    
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
