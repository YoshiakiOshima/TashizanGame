//
//  ResultsView.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/05.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "ResultsView.h"
#import "LogicView.h"

@implementation ResultsView {
    LogicView *logicView;
    int resultScore,resultSum;
    int playCount;
    int t;
}

- (void)awakeFromNib {
    _sayLbl.hidden=YES;
    
    logicView=[LogicView alloc];
    logicView.resultsUD=[NSUserDefaults standardUserDefaults];
    resultScore=[logicView.resultsUD integerForKey:@"score"];
    resultSum=[logicView.resultsUD integerForKey:@"sum"];
    _scoreLbl.text=[NSString stringWithFormat:@"%d",resultScore];
    _sumLbl.text=[NSString stringWithFormat:@"%d",resultSum];
    
    playCount=[logicView.resultsUD integerForKey:@"playCount"];
    playCount++;
    [logicView.resultsUD setInteger:playCount forKey:@"playCount"];
    
    [self achieveJudge];
    
    
    if ([logicView.resultsUD integerForKey:@"pass"]==1) {
        _sayLbl.hidden=NO;
    }
    [logicView.resultsUD setInteger:0 forKey:@"pass"];
    [logicView.resultsUD synchronize];
}

- (void)achieveJudge {
    if (resultScore>[logicView.resultsUD integerForKey:@"MaxScore"]) {
        [logicView.resultsUD setInteger:resultScore forKey:@"MaxScore"];
        [self reportGameCenter];
    }
    if (resultSum>[logicView.resultsUD integerForKey:@"MaxSum"]) {
        [logicView.resultsUD setInteger:resultSum forKey:@"MaxSum"];
    }
    [logicView.resultsUD synchronize];
    
    logicView.achieveUD=[NSUserDefaults standardUserDefaults];
    if (playCount==1) {
        t=1;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve1"];
    }
    if (playCount==10) {
        t=2;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve2"];
    }
    if (playCount==100) {
        t=3;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve3"];
    }
    if (resultScore>=100) {
        t=4;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve4"];
    }
    if (resultScore>=1000) {
        t=5;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve5"];
    }
    if (resultScore>=5000) {
        t=6;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve6"];
    }
    if (resultScore>=10000) {
        t=7;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve7"];
    }
    if (resultScore>=100000) {
        t=8;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve8"];
    }
    if (resultSum>=100) {
        t=9;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve9"];
    }
    if (resultSum>=1000) {
        t=10;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve10"];
    }
    if (resultSum>=5000) {
        t=11;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve11"];
    }
    if (resultScore>=70000) {
        t=22;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve22"];
    }
    if (resultScore>=7000) {
        t=25;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve25"];
    }
    if (resultScore>=30000) {
        t=26;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve26"];
    }
    if (resultScore>=50000) {
        t=27;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve27"];
    }
    if (resultScore>=500000) {
        t=28;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve28"];
    }
    if (resultScore>=3000000) {
        t=29;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve29"];
    }
    if (resultScore>=99999999) {
        t=30;
        [self achievePass2];
        [logicView.achieveUD setInteger:1 forKey:@"achieve30"];
    }
    [logicView.achieveUD synchronize];
}

- (void)reportGameCenter {
    GKScore *scoreReporter1 = [[GKScore alloc] initWithCategory:@"-----------------"];
    int64_t score1 = resultScore;
    scoreReporter1.value = score1;
    [scoreReporter1 reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil)
        {
            // 報告エラーの処理
        }
    }];
}

- (void)achievePass2 {
    int d=[logicView.achieveUD integerForKey:[NSString stringWithFormat:@"achieve%d",t]];
    if (d==0) {
        [logicView.resultsUD setInteger:1 forKey:@"pass"];
    }
}

@end
