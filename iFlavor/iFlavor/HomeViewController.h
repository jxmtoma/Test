//
//  HomeViewController.h
//  iFlavor
//
//  Created by Toma Ju on 10/31/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *selectedRows;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionsView;

@end
