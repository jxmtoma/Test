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

@synthesize scrollView,pageControl,imageArray,mapView,FullScrollView,Label;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 34.014961;
    zoomLocation.longitude= -118.282328;
    // 2
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
    
    [self.FullScrollView setScrollEnabled:YES];
    [self.FullScrollView setContentSize:CGSizeMake(320, 900)];
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 34.014961;
    coordinate1.longitude = -118.282328;
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Figueroa Philly Cheese Steak"];
    [self.mapView addAnnotation: annotation];
    
    Label.text = @"3844 S Figueroa St Los Angeles, CA 90037 Neighborhood: Exposition Park (213) 748-9073 figueroaphilly.com";
    
    imageArray = [[NSArray alloc] initWithObjects:@"f1.jpg",@"f2.jpg",@"f3.jpg",nil];
    
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

@end
