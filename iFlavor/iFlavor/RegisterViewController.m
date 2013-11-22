//
//  RegisterViewController.m
//  iFlavor
//
//  Created by Toma Ju on 10/29/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize theNewUserName, theNewPassword, passwordConfirm;

- (IBAction)dismiss:(UIButton *)sender {
    [theNewPassword resignFirstResponder];
    [theNewUserName resignFirstResponder];
    [passwordConfirm resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
