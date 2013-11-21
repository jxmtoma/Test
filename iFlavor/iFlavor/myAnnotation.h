//
//  myAnnotation.h
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface myAnnotation : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (id) initWithCoordinate: (CLLocationCoordinate2D) coordinate title:(NSString *) title;

@end
