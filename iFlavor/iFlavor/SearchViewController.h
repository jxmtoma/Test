//
//  SearchViewController.h
//  iFlavor
//
//  Created by Toma Ju on 11/17/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UISearchBarDelegate, UISearchDisplayDelegate ,UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *searchTable;

@end
