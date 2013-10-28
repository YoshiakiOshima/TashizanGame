//
//  AchieveView.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AchieveView : UIView

@property (weak, nonatomic) IBOutlet UILabel *maxScoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *maxSumLbl;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;


- (void)achieveJudge;
- (void)makeNumberLbl;
- (void)makeAchieveLbl;
- (void)textSet;
- (void)achieveText;

@end
