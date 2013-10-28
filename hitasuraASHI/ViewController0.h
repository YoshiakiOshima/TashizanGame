//
//  ViewController0.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/14.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController0 : UIViewController

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UIView *coverView1;
@property (weak, nonatomic) IBOutlet UIView *coverView2;
@property (weak, nonatomic) IBOutlet UIView *coverView3;


- (IBAction)pushBack00:(UIStoryboardSegue *)segue;

- (IBAction)pushBtn1_2:(id)sender;
- (IBAction)pushBtn2_3:(id)sender;
- (IBAction)pushBtn2_1:(id)sender;
- (IBAction)pushBtn3_2:(id)sender;

- (void)move1_2;
- (void)move2_3;
- (void)move2_1;
- (void)move3_2;





@end
