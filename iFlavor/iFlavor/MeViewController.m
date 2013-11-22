//
//  MeViewController.m
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "MeViewController.h"
#import "MeSegmentControl.h"

@interface MeViewController () {
    UIImage *image;
    NSArray *meTags;
}

@end

@implementation MeViewController
@synthesize coverImage, meSegmentedControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [[cell textLabel] setText:[NSString stringWithFormat:@"This is %d", self.meSegmentedControl.selectedSegmentIndex]];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    image = [UIImage imageNamed:@"MeCover.jpg"];
    [coverImage setImage:image];
    //meTags = [[NSArray alloc]initWithObjects:@"visit",@"like",@"friend",@"review",@"message", nil];
    self.meTableView.dataSource = self;
    [self.meTableView setDelegate:self];
    
}

- (IBAction)segmentDidChange:(id)sender
{
    [self.meTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
