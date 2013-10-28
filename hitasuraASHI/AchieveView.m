//
//  AchieveView.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "AchieveView.h"
#import "LogicView.h"

@implementation AchieveView {
    LogicView *logicView;
    __weak IBOutlet UIView *underScrollView;
    NSMutableArray *labelArray;
    UIScrollView *sv;
    UILabel *tempLbl;
    int achieveNumber;
}

- (void)awakeFromNib {
    
    sv=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 140, 320, 428)];
//    sv.backgroundColor=[UIColor greenColor];
    [self addSubview:sv];
    [self makeNumberLbl];
    [self makeAchieveLbl];
    [self textSet];
    [self achieveText];
    sv.contentSize=CGSizeMake(320, 1400);
    
    logicView=[LogicView alloc];
    logicView.resultsUD=[NSUserDefaults standardUserDefaults];
    _maxScoreLbl.text=[NSString stringWithFormat:@"%d",[logicView.resultsUD integerForKey:@"MaxScore"]];
    _maxSumLbl.text=[NSString stringWithFormat:@"%d",[logicView.resultsUD integerForKey:@"MaxSum"]];
    
    [self achieveJudge];
    
    [self addSubview:_backBtn];
}

- (void)achieveJudge {
    logicView.achieveUD=[NSUserDefaults standardUserDefaults];
//    if ([logicView.achieveUD integerForKey:@"achieve1"]==1) {
//        NSLog(@"ピタリ賞");
//    }
//    if ([logicView.achieveUD integerForKey:@"achieve2"]==1) {
//        NSLog(@"初プレイ");
//    }
//    if ([logicView.achieveUD integerForKey:@"achieve3"]==1) {
//        NSLog(@"５回プレイ");
//    }
    for (int n=1; n<=30; n++) {
        if ([logicView.achieveUD integerForKey:[NSString stringWithFormat:@"achieve%d",n]]==1) {
            tempLbl=(UILabel *)[labelArray objectAtIndex:n-1];
            tempLbl.hidden=NO;
        }
    }
}

- (void)makeNumberLbl {
    for (int n=1; n<=30; n++) {
        UILabel *numLbl;
        numLbl=[[UILabel alloc] init];
        numLbl.frame=CGRectMake(15, 40*n-25, 35, 35);
        numLbl.backgroundColor=[[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:0];
        numLbl.font=[UIFont boldSystemFontOfSize:12];
        numLbl.text=[NSString stringWithFormat:@"%d",n];
        numLbl.textAlignment=NSTextAlignmentCenter;
        [sv addSubview:numLbl];
    }
}

- (void)makeAchieveLbl {
    labelArray=[NSMutableArray array];
    for (int n=1; n<=30; n++) {
        UILabel *numLbl;
        numLbl=[[UILabel alloc] init];
        numLbl.frame=CGRectMake(55, 40*n-25, 270, 35);
        numLbl.backgroundColor=[[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:0];
        numLbl.font=[UIFont boldSystemFontOfSize:12];
        numLbl.text=[NSString stringWithFormat:@"%d",n];
//        numLbl.textAlignment=NSTextAlignmentCenter;
        [sv addSubview:numLbl];
        [labelArray addObject:(id)numLbl];
    }
}

- (void)textSet {
    for (achieveNumber=1; achieveNumber<=30; achieveNumber++) {
        tempLbl=(UILabel *)[labelArray objectAtIndex:achieveNumber-1];
        tempLbl.hidden=YES;
        [self achieveText];
    }
}

- (void)achieveText {
    if (achieveNumber==1) {
        tempLbl.text=@"初プレイ";
    }else if (achieveNumber==2) {
        tempLbl.text=@"10回プレイ";
    }else if (achieveNumber==3) {
        tempLbl.text=@"100回プレイ";
    }else if (achieveNumber==4) {
        tempLbl.text=@"score100以上";
    }else if (achieveNumber==5) {
        tempLbl.text=@"score1000以上";
    }else if (achieveNumber==6) {
        tempLbl.text=@"score5000以上";
    }else if (achieveNumber==7) {
        tempLbl.text=@"score10000以上";
    }else if (achieveNumber==8) {
        tempLbl.text=@"score100000以上";
    }else if (achieveNumber==9) {
        tempLbl.text=@"sum100以上";
    }else if (achieveNumber==10) {
        tempLbl.text=@"sum1000以上";
    }else if (achieveNumber==11) {
        tempLbl.text=@"sum5000以上";
    }else if (achieveNumber==12) {
        tempLbl.text=@"ピタリ賞";
    }else if (achieveNumber==13) {
        tempLbl.text=@"5コンボ";
    }else if (achieveNumber==14) {
        tempLbl.text=@"10コンボ";
    }else if (achieveNumber==15) {
        tempLbl.text=@"30コンボ";
    }else if (achieveNumber==16) {
        tempLbl.text=@"失敗した。失敗した。失敗した。";
    }else if (achieveNumber==17) {
        tempLbl.text=@"ラッキーセブン";
    }else if (achieveNumber==18) {
        tempLbl.text=@"ジャスト1000";
    }else if (achieveNumber==19) {
        tempLbl.text=@"疾如風";
    }else if (achieveNumber==20) {
        tempLbl.text=@"徐如林";
    }else if (achieveNumber==21) {
        tempLbl.text=@"侵掠如火";
    }else if (achieveNumber==22) {
        tempLbl.text=@"難知如陰";
    }else if (achieveNumber==23) {
        tempLbl.text=@"不動如山";
    }else if (achieveNumber==24) {
        tempLbl.text=@"動如雷霆";
    }else if (achieveNumber==25) {
        tempLbl.text=@"算数の自慢ができるレベル";
    }else if (achieveNumber==26) {
        tempLbl.text=@"賢人";
    }else if (achieveNumber==27) {
        tempLbl.text=@"やるな！レビューで『YOYU~』と投稿すべし";
    }else if (achieveNumber==28) {
        tempLbl.text=@"神";
    }else if (achieveNumber==29) {
        tempLbl.text=@"え？このゲーム終わらないよ？（笑）";
    }else if (achieveNumber==30) {
        tempLbl.text=@"限界突破";
    }
}

@end
