//
//  GuideViewController.m
//  iFlavor
//
//  Created by Toma Ju on 12/2/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()
{
    int tapNumber;
}

@end

@implementation GuideViewController
@synthesize guideImage;

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
    tapNumber = 0;
    [self.guideImage setImage:[UIImage imageNamed:@"help1.jpg"]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture)];
    
    // Specify that the gesture must be a single tap
    tapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self.view addGestureRecognizer:tapRecognizer];
    
}

-(void)respondToTapGesture {
    switch (tapNumber) {
        case 0:
            
            break;
        case 1:
            break;
        case 5:
            [self performSegueWithIdentifier:@"BackToHome" sender:self];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
