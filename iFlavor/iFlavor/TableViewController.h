//
//  TableViewController.h
//  iFlavor
//
//  Created by Toma Ju on 10/29/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *flavor;
@property (nonatomic, strong) NSArray *flavorKeys;


@end
