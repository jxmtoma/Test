//
//  SearchViewController.m
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () {
    BOOL isFiltered;
    NSMutableArray *menuArray;
    NSMutableArray *filterArray;
}

@end

@implementation SearchViewController
@synthesize searchTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.searchDisplayController setDisplaysSearchBarInNavigationBar:YES];
    self.searchTable.dataSource = self;
    self.searchTable.delegate = self;
    menuArray = [[NSMutableArray alloc]initWithObjects:@"What is hot!",@"recent search",@"what is nearby", nil];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        isFiltered = NO;
    }
    else {
        isFiltered = YES;
        filterArray = [[NSMutableArray alloc]init];
        //search prediction...
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isFiltered) {
        return 6;
    }
    return [menuArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (!isFiltered) {
        cell.textLabel.text = [menuArray objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"Search Result Section %d Row %d",indexPath.section,indexPath.row];
    }
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
