//
//  HomeCell.m
//  iFlavor
//
//  Created by Toma Ju on 11/10/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

@synthesize title = _title;
@synthesize ranking = _ranking;
@synthesize imageName = _imageName;
@synthesize detail = _detail;

- (id)initWithTitle:(NSString *)title
            ranking:(float)ranking
            detail:(NSString *)detail imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        // Initialization code
        _imageName = imageName;
        _ranking = ranking;
        _title = title;
        _detail = detail;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
