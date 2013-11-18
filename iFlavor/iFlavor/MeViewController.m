//
//  MeViewController.m
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "MeViewController.h"
#import "MeCell.h"

@interface MeViewController () {
    UIImage *image;
    NSArray *meTags;
}

@end

@implementation MeViewController
@synthesize coverImage, meCollectionView;

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
    [[self meCollectionView]setDelegate:self];
    [[self meCollectionView]setDataSource:self];
    
    image = [UIImage imageNamed:@"MeCover.jpg"];
    [coverImage setImage:image];
    meTags = [[NSArray alloc]initWithObjects:@"flavor",@"visited",@"liked",@"friends",@"reviews",@"messages", nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [meTags count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"Cell";
    MeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell meCellDiscreption] setText:[meTags objectAtIndex:indexPath.item]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
