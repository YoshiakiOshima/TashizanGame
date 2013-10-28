//
//  ViewController.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/04.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property NSUserDefaults *playUD;


- (IBAction)pushBack:(UIStoryboardSegue *)segue;
- (IBAction)toItunes:(id)sender;


@end
