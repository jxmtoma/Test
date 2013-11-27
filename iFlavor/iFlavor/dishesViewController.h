//
//  dishesViewController.h
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <CoreLocation/CoreLocation.h>

@interface dishesViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageScroll;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *imageArray;

- (IBAction)GetDirection:(id)sender;
@property CLLocationCoordinate2D coords;
@property (strong, nonatomic) IBOutlet UIImageView *dish1;
@property (strong, nonatomic) IBOutlet UIImageView *dish2;
@property (strong, nonatomic) IBOutlet UIScrollView *fullScroll;

@end
