//
//  LogicView.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/04.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogicView : UIView


@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UILabel *targetLbl;
@property (weak, nonatomic) IBOutlet UILabel *sumLbl;
@property (weak, nonatomic) IBOutlet UILabel *scoreLbl;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UILabel *moreLbl;


@property UIView *logicView;
@property UIButton *baseBtn;
@property NSMutableArray *btnNumArray;
@property NSMutableArray *btnArray;
@property int sum,score;
@property NSUserDefaults *resultsUD;
@property NSUserDefaults *achieveUD;
@property int pass;




- (void)makeBtn;
- (void)makeView;
- (void)displayNumber;
- (void)setNumber;
- (void)displayBtn;
- (void)scoreJudge;
- (void)endedTimer:(NSTimer *)timer;

- (IBAction)pushStart:(id)sender;

- (void)inisualize;

- (void)endMethod;

- (void)achievePass;


@end
