//
//  HomeCell.h
//  iFlavor
//
//  Created by Toma Ju on 11/10/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : NSObject {
    NSString *_title;
    float _ranking;
    NSString *_detail;
    NSString *_imageName;
}

@property NSString *title;
@property float ranking;
@property NSString *imageName;
@property NSString *detail;

- (id)initWithTitle:(NSString *)title
           ranking:(float)ranking
             detail:(NSString *)detail
           imageName:(NSString *)imageName;

@end
