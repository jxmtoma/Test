//
//  ViewController.m
//  iFlavor
//
//  Created by Toma Ju on 10/28/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userName, password;

- (IBAction)submit:(UIButton *)sender {
    [userName resignFirstResponder];
    [password resignFirstResponder];
    //check the username here
    
//    TableViewController *tableView = [[TableViewController alloc] initWithNibName:@"TableView" bundle:Nil];
//    [self.view addSubview:tableView.view];
}

- (IBAction)dismiss:(UIButton *)sender {
    [userName resignFirstResponder];
    [password resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
