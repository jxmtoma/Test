//
//  ViewController.h
//  iFlavor
//
//  Created by Toma Ju on 10/28/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *userName;
@property (nonatomic, strong) IBOutlet UITextField *password;

-(IBAction)dismiss:(UIButton *)sender;

@end
