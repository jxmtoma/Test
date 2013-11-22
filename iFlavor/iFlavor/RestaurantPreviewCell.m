//
//  RestaurantPreviewCell.m
//  iFlavor
//
//  Created by Huaiqi Wang on 11/19/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "RestaurantPreviewCell.h"

@implementation RestaurantPreviewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"RestaurantPreviewCell" owner:self options:nil];
        self = [nibArray objectAtIndex:0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
