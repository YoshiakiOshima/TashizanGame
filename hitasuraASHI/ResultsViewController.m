//
//  ResultsViewController.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

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

- (IBAction)toGameBoard:(id)sender {
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    leaderboardController.leaderboardDelegate = self;
    [self presentViewController:leaderboardController animated:YES completion:nil];
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
