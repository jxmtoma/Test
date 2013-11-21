//
//  dishesViewController.m
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "dishesViewController.h"

@interface dishesViewController ()

@end

@implementation dishesViewController

@synthesize imageScroll,pageControl,imageArray;

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
    
    imageArray = [[NSArray alloc] initWithObjects:@"s1.jpg",@"s2.jpg",@"s3.jpg",nil];
    
    imageScroll.contentSize = CGSizeMake(imageScroll.frame.size.width * [imageArray count], imageScroll.frame.size.height);
    
    
    for (int i = 0; i < [imageArray count]; i++) {
        CGRect frame;
        frame.origin.x = self.imageScroll.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.imageScroll.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[imageArray objectAtIndex: i]];
        [self.imageScroll addSubview: imageView];
    }

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.imageScroll.frame.size.width;
    int page = floor((self.imageScroll.contentOffset.x - pageWidth/2 ) / pageWidth);
    self.pageControl.currentPage = page;
}

@end
