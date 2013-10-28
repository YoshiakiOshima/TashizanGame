//
//  TitleViewController.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface TitleViewController : UIViewController

- (void)authenticateLocalPlayer;
- (IBAction)pushBack2:(UIStoryboardSegue *)segue;
- (IBAction)pushBack3:(UIStoryboardSegue *)segue;

@end
