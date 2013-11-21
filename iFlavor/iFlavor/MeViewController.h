//
//  MeViewController.h
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeSegmentControl.h"

@interface MeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *meSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *meTableView;
-(IBAction)segmentDidChange:(id)sender;

@end
