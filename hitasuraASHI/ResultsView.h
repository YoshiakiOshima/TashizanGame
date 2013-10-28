//
//  ResultsView.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface ResultsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *scoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *sumLbl;
@property (weak, nonatomic) IBOutlet UILabel *sayLbl;


- (void)achieveJudge;
- (void)reportGameCenter;
- (void)achievePass2;

@end
