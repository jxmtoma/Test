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
@synthesize guideImage, setOrNot;

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
    [self.guideImage setImage:[UIImage imageNamed:@"guideStart.jpg"]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture)];
    
    // Specify that the gesture must be a single tap
    tapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self.view addGestureRecognizer:tapRecognizer];
    
}

-(void)respondToTapGesture {
    switch (tapNumber) {
        case 0: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_home1.jpg"]];
            tapNumber++;
        }
            break;
        case 1: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_search1.jpg"]];
            tapNumber++;
        }
            break;
        case 2: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_me1.jpg"]];
            tapNumber++;
        }
            break;
        case 3: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_me2.jpg"]];
            tapNumber++;
        }
            break;
        case 4: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_me3.jpg"]];
            tapNumber++;
        }
            break;
        case 5: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_me4.jpg"]];
            tapNumber++;
        }
            break;
        case 6: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_restuarant1.jpg"]];
            tapNumber++;
        }
            break;
        case 7: {
            [self.guideImage setImage:[UIImage imageNamed:@"help_dish1.jpg"]];
            tapNumber++;
        }
            break;
        case 8:{
            if (setOrNot) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops" message:@"No Guide Left!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                
            }
            else
                [self performSegueWithIdentifier:@"BackToHome" sender:self];
        }
            break;
            
        default: {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops" message:@"No Guide Left!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
