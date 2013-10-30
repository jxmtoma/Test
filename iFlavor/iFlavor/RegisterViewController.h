//
//  RegisterViewController.h
//  iFlavor
//
//  Created by Toma Ju on 10/29/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *theNewUserName;
@property (nonatomic, strong) IBOutlet UITextField *theNewPassword;
@property (nonatomic, strong) IBOutlet UITextField *passwordConfirm;

-(IBAction)dismiss:(UIButton *)sender;

@end
