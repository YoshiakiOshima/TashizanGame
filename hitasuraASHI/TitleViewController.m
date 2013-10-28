//
//  TitleViewController.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "TitleViewController.h"
#import "ViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController {
    ViewController *viewController;
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
    [self authenticateLocalPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authenticateLocalPlayer
{
    __weak GKLocalPlayer* player = [GKLocalPlayer localPlayer];
    player.authenticateHandler = ^(UIViewController* ui, NSError* error )
    {
        
        if( nil != ui )
        {
            [self presentViewController:ui animated:YES completion:nil];
        }
        else if( player.isAuthenticated )
        {
            // 認証に成功
//            NSLog(@"aaa");
        }
        else
        {
            // 認証に失敗
//            NSLog(@"bbb");
        }
    };
}

- (IBAction)pushBack2:(UIStoryboardSegue *)segue {
    
}

- (IBAction)pushBack3:(UIStoryboardSegue *)segue {
    viewController=[ViewController alloc];
    viewController.playUD=[NSUserDefaults standardUserDefaults];
    [viewController.playUD setInteger:1 forKey:@"playPass"];
    [viewController.playUD synchronize];
//    NSLog(@"%d",[viewController.playUD integerForKey:@"playPass"]);
}

@end
