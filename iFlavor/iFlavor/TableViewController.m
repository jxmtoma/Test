//
//  TableViewController.m
//  iFlavor
//
//  Created by Toma Ju on 10/29/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "TableViewController.h"
#import "HomeViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize flavor, flavorKeys,tablesView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [flavor count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    NSString *currentFlavor = [flavorKeys objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentFlavor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Flavors:";
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}

-(NSArray *)selectedItems {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSIndexPath *rows in [self.tablesView indexPathsForSelectedRows]) {
        
        UITableViewCell *cell = [self.tablesView cellForRowAtIndexPath:rows];
        //NSLog(@"%@", cell.textLabel.text);
        [result addObject:cell.textLabel.text];
    }
    return result;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITabBarController *controller = segue.destinationViewController;
    UINavigationController *navController = [[controller customizableViewControllers] objectAtIndex:0];
    HomeViewController *homeView = [[HomeViewController alloc] init];
    homeView = [[navController viewControllers] objectAtIndex:0];
    homeView.selectedRows = [self selectedItems];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *flavorFile = [[NSBundle mainBundle] pathForResource:@"Flavor" ofType:@"plist"];
    flavor = [[NSDictionary alloc] initWithContentsOfFile:flavorFile];
    flavorKeys = [flavor allKeys];
    self.tablesView.allowsMultipleSelection = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
