//
//  myAnnotation.m
//  iFlavor
//
//  Created by Baiya Su on 11/21/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

- (id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title{
    if ((self = [super init])) {
        self.coordinate = coordinate;
        self.title = title;
    }
    return self;
}

@end
