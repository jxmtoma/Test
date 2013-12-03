//
//  SearchViewController.m
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "SearchViewController.h"
#import "RestaurantViewController.h"
#import "dishesViewController.h"

@interface SearchViewController () {
    BOOL isFiltered;
    
    NSMutableArray *restImageArray;
    NSMutableArray *restNameArray;
    NSMutableArray *restRatingArray;
    NSMutableArray *restLocArray;
    NSMutableArray *restDisArray;
    
    NSMutableArray *dishExpArray;
    NSMutableArray *dishImageArray;
    NSMutableArray *dishNameArray;
    NSMutableArray *dishRatingArray;
    NSMutableArray *dishRestArray;
    
}

@end

@implementation SearchViewController

@synthesize searchTable, searchBar;

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
    
    NSString *imagefile = [[NSBundle mainBundle] pathForResource:@"Dino's Chicken and Burgers Restaurant" ofType:@"jpg"];
	UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    restImageArray = [[NSMutableArray alloc] init];
    [restImageArray addObject:image];
    imagefile = [[NSBundle mainBundle] pathForResource:@"Figueroa Philly Cheese Steak Restaurant" ofType:@"jpg"];
	image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    [restImageArray addObject:image];
    imagefile = [[NSBundle mainBundle] pathForResource:@"Soowon Galbi KBBQ Restaurant" ofType:@"jpg"];
	image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    [restImageArray addObject:image];
    
    restNameArray = [[NSMutableArray alloc] init];
    [restNameArray addObject:@"Dino's Chicken and Burgers"];
    [restNameArray addObject:@"Figueroa Philly Cheese Steak"];
    [restNameArray addObject:@"Soowon Galbi KBBQ"];
    
    restRatingArray = [[NSMutableArray alloc] init];
    [restRatingArray addObject:[NSNumber numberWithFloat:4]];
    [restRatingArray addObject:[NSNumber numberWithFloat:3]];
    [restRatingArray addObject:[NSNumber numberWithFloat:5]];
    
    restLocArray = [[NSMutableArray alloc] init];
    [restLocArray addObject:@"2575 W Pico Blvd"];
    [restLocArray addObject:@"3844 S Figueroa St"];
    [restLocArray addObject:@"856 S Vermont Ave"];
    
    restDisArray = [[NSMutableArray alloc] init];
    [restDisArray addObject:@"0.6m"];
    [restDisArray addObject:@"1.1m"];
    [restDisArray addObject:@"1.5m"];
    
    dishExpArray = [[NSMutableArray alloc] init];
    [dishExpArray addObject:@"$$"];
    [dishExpArray addObject:@"$"];
    [dishExpArray addObject:@"$$$"];
    
    
    imagefile = [[NSBundle mainBundle] pathForResource:@"Carne Asada Fries" ofType:@"jpg"];
	image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    dishImageArray = [[NSMutableArray alloc] init];
    [dishImageArray addObject:image];
    imagefile = [[NSBundle mainBundle] pathForResource:@"Figueroa Philly Cheese Steak" ofType:@"jpg"];
	image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    [dishImageArray addObject:image];
    imagefile = [[NSBundle mainBundle] pathForResource:@"Grilled Shrimp" ofType:@"jpg"];
	image = [[UIImage alloc] initWithContentsOfFile:imagefile];
    [dishImageArray addObject:image];
    
    dishNameArray = [[NSMutableArray alloc] init];
    [dishNameArray addObject:@"Carne Asada Fries"];
    [dishNameArray addObject:@"Figueroa Philly Cheese Steak"];
    [dishNameArray addObject:@"Grilled Shrimp"];
    
    dishRatingArray = [[NSMutableArray alloc] init];
    [dishRatingArray addObject:[NSNumber numberWithFloat:5]];
    [dishRatingArray addObject:[NSNumber numberWithFloat:3]];
    [dishRatingArray addObject:[NSNumber numberWithFloat:4]];
    
    dishRestArray = [[NSMutableArray alloc] init];
    [dishRestArray addObject:@"Dino's Chicken and Burgers Restaurant"];
    [dishRestArray addObject:@"Figueroa Philly Cheese Steak Restaurant"];
    [dishRestArray addObject:@"Soowon Galbi KBBQ Restaurant"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        isFiltered = NO;
        //searchTable.hidden = YES;
    }
    else {
        isFiltered = YES;
        //search prediction...
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    RestaurantPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[RestaurantPreviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (!isFiltered) {
        cell.titleLabel.hidden = YES;
        cell.rating.hidden = YES;
        cell.subtitleLabel.hidden = YES;
        cell.distance.hidden = YES;
        //cell.expense.hidden = YES;
        return cell;
    }
    
    if(searchBar.selectedScopeButtonIndex == 0) {
        cell.titleLabel.text = [restNameArray objectAtIndex:indexPath.row];
        cell.subtitleLabel.text = [restLocArray objectAtIndex:indexPath.row];
        cell.distance.text = [restDisArray objectAtIndex:indexPath.row];
        //cell.expense.text = [restExpArray objectAtIndex:indexPath.row];
        //cell.expense.hidden = YES;
        
        NSNumber *arating = [restRatingArray objectAtIndex:indexPath.row];
        NSMutableString *ratingString = [[NSMutableString alloc] init];
        const char starFill[4] = {0xE2, 0x98, 0x85, 0x00};
        const char starEmpty[4] = {0xE2, 0x98, 0x86, 0x00};
        for (int i = 0; i < 5; i++) {
            if ([arating floatValue] > (float)i) {
                [ratingString appendString:[NSString stringWithUTF8String:starFill]];
            } else {
                [ratingString appendString:[NSString stringWithUTF8String:starEmpty]];
            }
        }
        cell.rating.text = [NSString stringWithString:ratingString];
        cell.imageLabel.image = [restImageArray objectAtIndex:indexPath.row];
    }
    
    if(searchBar.selectedScopeButtonIndex == 1) {
        cell.titleLabel.text = [dishNameArray objectAtIndex:indexPath.row];
        NSNumber *arating = [dishRatingArray objectAtIndex:indexPath.row];
        NSMutableString *ratingString = [[NSMutableString alloc] init];
        const char starFill[4] = {0xE2, 0x98, 0x85, 0x00};
        const char starEmpty[4] = {0xE2, 0x98, 0x86, 0x00};
        for (int i = 0; i < 5; i++) {
            if ([arating floatValue] > (float)i) {
                [ratingString appendString:[NSString stringWithUTF8String:starFill]];
            } else {
                [ratingString appendString:[NSString stringWithUTF8String:starEmpty]];
            }
        }
        cell.rating.text = [NSString stringWithString:ratingString];
        cell.subtitleLabel.text = [dishRestArray objectAtIndex:indexPath.row];
        //cell.distance.hidden = YES;
        cell.distance.text = [dishExpArray objectAtIndex:indexPath.row];
        cell.imageLabel.image = [dishImageArray objectAtIndex:indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (searchBar.selectedScopeButtonIndex == 0) {
        //restaurant
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
        dishesViewController *rvc = [sb instantiateViewControllerWithIdentifier:@"dishesViewController"];
        rvc.index = [NSString stringWithString:[restNameArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:rvc animated:YES];
    }
    if (searchBar.selectedScopeButtonIndex == 1) {
        //dish
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
        RestaurantViewController *dvc = [sb instantiateViewControllerWithIdentifier:@"RestaurantViewController"];
        [self.navigationController pushViewController:dvc animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
