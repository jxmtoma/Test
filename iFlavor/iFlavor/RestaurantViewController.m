//
//  RestaurantViewController.m
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "RestaurantViewController.h"
#import "myAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface RestaurantViewController ()

@end

@implementation RestaurantViewController

@synthesize scrollView,pageControl,imageArray,mapView,FullScrollView,Label,coords,rateImage,index;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CLLocationCoordinate2D zoomLocation;
    if ([self.index isEqualToString:@"Figueroa Philly Cheese Steak"]){
        zoomLocation.latitude = 34.014961;
        zoomLocation.longitude= -118.282328;
    }else if ([self.index isEqualToString:@"Carne Asada Fries"]){
        zoomLocation.latitude = 34.047788;
        zoomLocation.longitude = -118.293894;
    }else if ([self.index isEqualToString:@"Grilled Shrimp"]){
        zoomLocation.latitude = 34.056686;
        zoomLocation.longitude = -118.291448;
    }
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}

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
    
    [self.rateImage setImage:[UIImage imageNamed:@"rate.png"]];
    
    [self.FullScrollView setScrollEnabled:YES];
    [self.FullScrollView setContentSize:CGSizeMake(320, 650)];
    
    CLLocationCoordinate2D coordinate1;
    myAnnotation *annotation;
    if ([self.index isEqualToString:@"Figueroa Philly Cheese Steak"]){
        coordinate1.latitude = 34.014961;
        coordinate1.longitude= -118.282328;
        annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Figueroa Philly Cheese Steak"];
        Label.text = @"3844 S Figueroa St Los Angeles, CA 90037 Neighborhood: Exposition Park (213) 748-9073 figueroaphilly.com";
        [self setTitle:@"Figueroa Philly Cheese Steak"];
        imageArray = [[NSArray alloc] initWithObjects:@"f2.jpg",@"f3.jpg",@"f5.jpg",nil];
    }else if ([self.index isEqualToString:@"Carne Asada Fries"]){
        coordinate1.latitude = 34.047788;
        coordinate1.longitude = -118.293894;
        annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Carne Asada Fries"];
        Label.text = @"2575 W Pico Blvd Los Angeles, CA 90006 Neighborhood: Pico-Union (213) 380-3554 dinoschickenandburgers.com";
        [self setTitle:@"Dino's Chicken and Burgers"];
        imageArray = [[NSArray alloc] initWithObjects:@"d2.jpg",@"d3.jpg",@"d4.jpg",nil];
    }else if ([self.index isEqualToString:@"Grilled Shrimp"]){
        coordinate1.latitude = 34.056686;
        coordinate1.longitude = -118.291448;
        annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Grilled Shrimp"];
        Label.text = @"856 S Vermont Ave Ste C Los Angeles, CA 90005 Neighborhood: Koreatown (213) 365-9292 soowongalbi.net";
        [self setTitle:@"Soowon Galbi KBBQ Restaurant"];
        imageArray = [[NSArray alloc] initWithObjects:@"s2.jpg",@"s4.jpg",@"s5.jpg",nil];
    }
    //coordinate1.latitude = 34.014961;
    //coordinate1.longitude = -118.282328;
    [self.mapView addAnnotation: annotation];
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [imageArray count], scrollView.frame.size.height);
    
    
    for (int i = 0; i < [imageArray count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[imageArray objectAtIndex: i]];
        [self.scrollView addSubview: imageView];
    }

	// Do any additional setup after loading the view.
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/2 ) / pageWidth);
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

- (IBAction)GetDirection:(id)sender {
    NSDictionary * address;

    if ([self.index isEqualToString:@"Figueroa Philly Cheese Steak"]) {
        coords.latitude = 34.014961;
        coords.longitude = -118.282328;
        
        address = @{
                    (NSString *)kABPersonAddressStreetKey: @"3844 S Figueroa St",
                    (NSString *)kABPersonAddressCityKey: @"Los Angeles",
                    (NSString *)kABPersonAddressStateKey: @"CA",
                    (NSString *)kABPersonAddressZIPKey:@"90037"
                    };
        
    }else if ([self.index isEqualToString:@"Carne Asada Fries"]){
        coords.latitude = 34.047788;
        coords.longitude = -118.293894;
        address = @{
                    (NSString *)kABPersonAddressStreetKey: @"2575 W Pico Blvd",
                    (NSString *)kABPersonAddressCityKey: @"Los Angeles",
                    (NSString *)kABPersonAddressStateKey: @"CA",
                    (NSString *)kABPersonAddressZIPKey:@"90006"
                    };
        
    }else if ([self.index isEqualToString:@"Grilled Shrimp"]){
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
- (IBAction)AddToFavorite:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"Are you sure you want to add this dish to favorite?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}
@end
