//
//  RestaurantViewController.h
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <CoreLocation/CoreLocation.h>

@interface RestaurantViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *imageArray;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (strong, nonatomic) IBOutlet UIScrollView *FullScrollView;

- (IBAction)GetDirection:(id)sender;
@property CLLocationCoordinate2D coords;
@property (strong, nonatomic) IBOutlet UIImageView *rateImage;


@end
