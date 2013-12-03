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

@synthesize imageScroll,pageControl,imageArray,coords,dish1,dish2,fullScroll,index;

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

   if ([self.index isEqualToString:@"Figueroa Philly Cheese Steak"]) {
       [self.dish1 setImage:[UIImage imageNamed:@"f4.jpg"]];
       [self.dish2 setImage:[UIImage imageNamed:@"f5.jpg"]];
       imageArray = [[NSArray alloc] initWithObjects:@"f1.jpg",@"f2.jpg",@"f3.jpg",nil];
       [self setTitle:@"Figueroa Philly Cheese Steak"];
   }else if ([self.index isEqualToString:@"Dino's Chicken and Burgers"]){
       [self.dish1 setImage:[UIImage imageNamed:@"d4.jpg"]];
       [self.dish2 setImage:[UIImage imageNamed:@"d5.jpg"]];
       imageArray = [[NSArray alloc] initWithObjects:@"d1.jpg",@"d2.jpg",@"d3.jpg",nil];
       [self setTitle:@"Dino's Chicken and Burgers"];
   }else if ([self.index isEqualToString:@"Soowon Galbi KBBQ"]){
       [self.dish1 setImage:[UIImage imageNamed:@"s4.jpg"]];
       [self.dish2 setImage:[UIImage imageNamed:@"s5.jpg"]];
       imageArray = [[NSArray alloc] initWithObjects:@"s1.jpg",@"s2.jpg",@"s3.jpg",nil];
       [self setTitle:@"Soowon Galbi KBBQ Restaurant"];
   }
    
    
    
    //[self.dish1 setImage:[UIImage imageNamed:@"f4.jpg"]];
    //[self.dish2 setImage:[UIImage imageNamed:@"f5.jpg"]];
    
    [self.fullScroll setScrollEnabled:YES];
    [self.fullScroll setContentSize:CGSizeMake(320, 580)];
    
    //imageArray = [[NSArray alloc] initWithObjects:@"s1.jpg",@"s2.jpg",@"s3.jpg",nil];
    
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

- (IBAction)GetDirection:(id)sender {
    
    self.index = @"ccc";
    NSDictionary * address;
    if ([self.index isEqualToString:@"abc"]) {
        coords.latitude = 34.014961;
        coords.longitude = -118.282328;
        
        address = @{
                                   (NSString *)kABPersonAddressStreetKey: @"3844 S Figueroa St",
                                   (NSString *)kABPersonAddressCityKey: @"Los Angeles",
                                   (NSString *)kABPersonAddressStateKey: @"CA",
                                   (NSString *)kABPersonAddressZIPKey:@"90037"
                                   };

    }else if ([self.index isEqualToString:@"bbb"]){
        coords.latitude = 34.047788;
        coords.longitude = -118.293894;
        address = @{
                    (NSString *)kABPersonAddressStreetKey: @"2575 W Pico Blvd",
                    (NSString *)kABPersonAddressCityKey: @"Los Angeles",
                    (NSString *)kABPersonAddressStateKey: @"CA",
                    (NSString *)kABPersonAddressZIPKey:@"90006"
                    };

    }else if ([self.index isEqualToString:@"ccc"]){
        coords.latitude = 34.056686;
        coords.longitude = -118.291448;
        address = @{
                    (NSString *)kABPersonAddressStreetKey: @"856 S Vermont Ave Ste C",
                    (NSString *)kABPersonAddressCityKey: @"Los Angeles",
                    (NSString *)kABPersonAddressStateKey: @"CA",
                    (NSString *)kABPersonAddressZIPKey:@"90005"
                    };
        
    }
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate: coords
                          addressDictionary: address];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
                              };
    
    [mapItem openInMapsWithLaunchOptions:options];

}
@end
