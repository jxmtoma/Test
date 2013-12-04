//
//  HomeViewController.m
//  iFlavor
//
//  Created by Toma Ju on 10/31/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "RestaurantViewController.h"
#import "dishesViewController.h"

@interface HomeViewController () {
    HomeCell *layer0;
    HomeCell *layer1;
    HomeCell *layer2;
    NSArray *totalLayers;
}

@end

@implementation HomeViewController
@synthesize selectedRows, homePageControl, homeScrollView, homeTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    dishesViewController *dvc = [segue destinationViewController];
    NSIndexPath *path = [self.homeTableView indexPathForSelectedRow];
    HomeCell *hc = [totalLayers objectAtIndex:path.row];
    dvc.index = [NSString stringWithString:hc.title];
}

-(UIImage*) drawText:(NSString*) text
             inImage:(UIImage*)  image
             atPoint:(CGPoint)   point
{
    
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    UIColor *color = [UIColor whiteColor];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSForegroundColorAttributeName: color,
                                   NSParagraphStyleAttributeName: paragraphStyle };
    UIGraphicsBeginImageContext(self.homeScrollView.frame.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y+100, image.size.width,image.size.height);
    [[UIColor whiteColor] setFill];
    
    [text drawInRect:CGRectIntegral(rect) withAttributes:attributes];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasPerformedFirstLaunch"]) {
//        // On first launch, this block will execute
//        
//        // Set the "hasPerformedFirstLaunch" key so this block won't execute again
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasPerformedFirstLaunch"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        NSLog(@"worked!");
//        [self performSegueWithIdentifier:@"FirstLaunch" sender:self];
//    }
    layer0 = [[HomeCell alloc]initWithTitle:@"Figueroa Philly Cheese Steak" ranking:3 detail:@"3844 S Figueroa St"  imageName:@"FigueroaPhillyCheese.jpg"];
    layer1 = [[HomeCell alloc]initWithTitle:@"Dino's Chicken and Burgers" ranking:3 detail:@"2575 W Pico Blvd"  imageName:@"Dino'sChickenandBurgers.jpg"];
    layer2 = [[HomeCell alloc]initWithTitle:@"Soowon Galbi KBBQ" ranking:4 detail:@"856 S Vermont Ave Ste C" imageName:@"SoowonGalbiKBBQRestaurant.jpg"];
    totalLayers = @[layer0, layer1, layer2];
    self.homePageControl.numberOfPages = [totalLayers count];
    [self.homeScrollView setContentSize:CGSizeMake(self.homeScrollView.frame.size.width*self.homePageControl.numberOfPages, self.homeScrollView.frame.size.height)];
    [self.homeScrollView setDelegate:self];
    [self.homePageControl setCurrentPage:0];
    [self.homeTableView setDelegate:self];
    [self.homeTableView setDataSource:self];
    [self setupScrollView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"HomeTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [[totalLayers objectAtIndex:indexPath.row] title];
    cell.detailTextLabel.text = [[totalLayers objectAtIndex:indexPath.row] detail];
    cell.imageView.image = [self ratingImage:[[totalLayers objectAtIndex:indexPath.row] ranking]];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Recommanded:";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void) setupScrollView {

    //setup internal views

    for (int i = 0; i < [homePageControl numberOfPages]; i++) {
        CGFloat xOrigin = i * self.homeScrollView.frame.size.width;
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(xOrigin, 0,
                                         self.homeScrollView.frame.size.width,
                                         self.homeScrollView.frame.size.height)];
        image.image = [self drawText:[[totalLayers objectAtIndex:i]title] inImage:[UIImage imageNamed:[[totalLayers objectAtIndex:i]imageName]] atPoint:CGPointMake(3, 110)];
        //image.contentMode = UIViewContentModeScaleAspectFit;
        [self.homeScrollView addSubview:image];
    }
}

#pragma mark - ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Get scrolling position, and send the alpha values.
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    float offset = scrollView.contentOffset.x;
    float pageSize = scrollView.frame.size.width;
    int page = (float) (offset + pageSize/2)/pageSize;
    self.homePageControl.currentPage = page;
}

-(UIImage *)ratingImage:(int)rate {
    switch (rate) {
        case 1:
            return [UIImage imageNamed:@"1StarSmall.png"];
            break;
        case 2:
            return [UIImage imageNamed:@"2StarSmall.png"];
            break;
        case 3:
            return [UIImage imageNamed:@"3StarSmall.png"];
            break;
        case 4:
            return [UIImage imageNamed:@"4StarSmall.png"];
            break;
        case 5:
            return [UIImage imageNamed:@"5StarSmall.png"];
            break;
            
        default:
            break;
    }
    return Nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
