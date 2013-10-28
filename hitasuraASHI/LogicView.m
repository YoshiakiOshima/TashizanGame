//
//  LogicView.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/04.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "LogicView.h"

@implementation LogicView {
    UIButton *tempBtn;
    float centerX,centerY;
    int moveCount;
    int onNumber,inNumber,nextNumber;
    int targetNum;
    int sec;
    NSTimer *tm;
    NSDate *stDate;
    int conboNum;
    int missNum;
    int t;
    float reminedTime;
}

- (void)awakeFromNib {
    [self makeView];
    [self makeBtn];
    [self setNumber];
    [self displayNumber];
    [self inisualize];
    
    _nextBtn.hidden=YES;
    
    targetNum=rand()%20+6;
    _targetLbl.text=[NSString stringWithFormat:@"%d",targetNum];
    _sum=0;
    moveCount=0;
    
    sec=60;
    
    conboNum=0;
    missNum=0;
    
    _pass=0;
    
    _logicView.hidden=YES;
    
    _resultsUD=[NSUserDefaults standardUserDefaults];
    NSString *str=[_resultsUD objectForKey:@"MaxScore"];
    _moreLbl.text=[NSString stringWithFormat:@"今までの最高score：%@",str];
    
    CGRect rect=[[UIScreen mainScreen] bounds];
    
    if (rect.size.height!=568) {
        _moreLbl.hidden=YES;
    }else {
        _moreLbl.hidden=NO;
    }
    
}

- (void)makeBtn {
    int x,y,z;
    _btnArray=[NSMutableArray array];
    UIImage *img=[UIImage imageNamed:@"btn1.4.png"];
    UIImage *img2=[UIImage imageNamed:@"back3.png"];
    for (x=0; x<=5; x++) {
        for (y=0; y<=5; y++) {
            z=x*6+y+1;
            
            UIImageView *iv=[[UIImageView alloc] initWithImage:img2];
            iv.frame=CGRectMake(53*x+1, 53*y+1, 53, 53);
            [_logicView addSubview:iv];
            
            _baseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            _baseBtn.frame=CGRectMake(53*x+1, 53*y+1, 53, 53);
            [_baseBtn addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
            [_baseBtn addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
            [_baseBtn addTarget:self action:@selector(dragInside:forEvent:) forControlEvents:UIControlEventTouchDragInside];
            [_baseBtn setBackgroundImage:img forState:UIControlStateNormal];
            _baseBtn.tag=z;
            [_logicView addSubview:_baseBtn];
            
            [_btnArray addObject:(id)_baseBtn];
            
        }
    }
}

- (void)makeView {    
    _logicView=[[UIView alloc] init];
    CGRect rect=[[UIScreen mainScreen] bounds];
    _logicView.frame=CGRectMake(0, rect.size.height-50-320, 320, 320);
    _logicView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [_baseView addSubview:_logicView];
    
}

- (void)displayNumber {
    for (int n=1; n<=36; n++) {
        tempBtn=(UIButton *)[_btnArray objectAtIndex:n-1];
        [tempBtn setTitle:[NSString stringWithFormat:@"%@",[_btnNumArray objectAtIndex:n-1]] forState:UIControlStateNormal];
        tempBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica-BoldOblique" size:18];
//        [tempBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

- (void)setNumber {
    _btnNumArray=[NSMutableArray array];
    srand(time(nil));
    for (int n=1; n<=36; n++) {
        int x=rand()%40+1;
        [_btnNumArray addObject:[NSNumber numberWithInt:x]];
    }
}

- (void)touchDown:(UIButton *)btn {
    for (int n=1; n<=36; n++) {
        if (n==btn.tag) {
            [_logicView bringSubviewToFront:btn];
            centerX=btn.center.x;
            centerY=btn.center.y;
        }
    }
}

- (void)dragInside:(UIButton *)dragBtn forEvent:(UIEvent *)event {
    for (int n=1; n<=36; n++) {
        if (n==dragBtn.tag) {
            UITouch *touch=[[event touchesForView:dragBtn] anyObject];
            CGPoint PrevPos=[touch previousLocationInView:dragBtn];
            CGPoint MovedPos=[touch locationInView:dragBtn];
            float dx=MovedPos.x-PrevPos.x;
            float dy=MovedPos.y-PrevPos.y;
            dragBtn.center=CGPointMake(dragBtn.center.x+dx, dragBtn.center.y+dy);
        }
    }
}

- (void)touchUp:(UIButton *)upBtn {
    if (reminedTime>=0) {
        moveCount=0;
        
        int upx=upBtn.center.x;
        int upy=upBtn.center.y;
        int amariUpx=(upx-1)%53;
        int amariUpy=(upy-1)%53;
        int shouUpx=(upx-amariUpx-1)/53;
        int shouUpy=(upy-amariUpy-1)/53;
        int btnz=shouUpx*6+shouUpy+1;
        
        onNumber=[[_btnNumArray objectAtIndex:upBtn.tag-1] intValue];
        
        srand(time(nil));
        [_btnNumArray replaceObjectAtIndex:upBtn.tag-1 withObject:[NSNumber numberWithInt:rand()%40+1]];
        if (btnz==upBtn.tag) {
            upBtn.center=CGPointMake(centerX, centerY);
            _sum=_sum+onNumber;
            _sumLbl.text=[NSString stringWithFormat:@"%d",_sum];
            [self displayNumber];
            [self displayBtn];
            [self scoreJudge];
        }else {
            upBtn.hidden=YES;
            inNumber=[[_btnNumArray objectAtIndex:btnz-1] intValue];
            nextNumber=onNumber+inNumber;
            [_btnNumArray replaceObjectAtIndex:btnz-1 withObject:[NSNumber numberWithInt:nextNumber]];
            [self displayNumber];
            upBtn.center=CGPointMake(centerX, centerY);
        }
    }
}

- (void)displayBtn {
    for (int n=1; n<=36; n++) {
        tempBtn=(UIButton *)[_btnArray objectAtIndex:n-1];
        tempBtn.hidden=NO;
    }
}

- (void)scoreJudge {
    _achieveUD=[NSUserDefaults standardUserDefaults];
    if (_sum%targetNum==0) {
        _score=_score+_sum;
        _scoreLbl.text=[NSString stringWithFormat:@"%d",_score];
        sec=sec+5;
        conboNum++;
        missNum=0;
//~ACHIEVE~
        if (_sum==targetNum) {
            t=12;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (conboNum==5) {
            t=13;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (conboNum==10) {
            t=14;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (conboNum==30) {
            t=15;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (onNumber<=3) {
            t=20;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (onNumber>=350) {
            t=21;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
        if (onNumber>=1000) {
            t=24;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
    }else {
        sec=sec-5;
        conboNum=0;
        missNum++;
//~ACHIEVE~
        if (missNum==3) {
            t=16;
            [self achievePass];
            [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
        }
    }
    srand(time(nil));
    targetNum=rand()%20+5;
    _targetLbl.text=[NSString stringWithFormat:@"%d",targetNum];
//~ACHIEVE~
    if (_sum==777) {
        t=17;
        [self achievePass];
        [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
    }
    if (_sum==1000) {
        t=18;
        [self achievePass];
        [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
    }
    [_achieveUD synchronize];
}

- (void)endedTimer:(NSTimer *)timer {
    moveCount++;
    NSDate *now=[NSDate date];
    float dt=[now timeIntervalSinceDate:stDate];
    reminedTime=sec-dt;
    _timeLbl.text=[NSString stringWithFormat:@"%0.1f",reminedTime];
//~ACHIEVE~
    _achieveUD=[NSUserDefaults standardUserDefaults];
    if (reminedTime>=80) {
        t=19;
        [self achievePass];
        [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
    }
    if (moveCount==100) {
        t=23;
        [self achievePass];
        [_achieveUD setInteger:1 forKey:[NSString stringWithFormat:@"achieve%d",t]];
    }
    [_achieveUD synchronize];
    if (reminedTime<=0) {
        _timeLbl.text=@"0.0";
        _logicView.hidden=YES;
        _nextBtn.hidden=NO;
        [tm invalidate];
        [self endMethod];
    }
}

- (IBAction)pushStart:(id)sender {
    stDate=[NSDate date];
    tm=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(endedTimer:) userInfo:nil repeats:YES];
    _startBtn.hidden=YES;
    _logicView.hidden=NO;
}

- (void)inisualize {
    _resultsUD=[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaultsResults=[NSMutableDictionary dictionary];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"sum"];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"score"];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"MaxScore"];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"MaxSum"];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"playCount"];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"pass"];
    [_resultsUD registerDefaults:defaultsResults];
    
    _achieveUD=[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaultsAchieve=[NSMutableDictionary dictionary];
    for (int n=1; n<=10; n++) {
        [defaultsAchieve setObject:[NSNumber numberWithInt:0] forKey:[NSString stringWithFormat:@"achieve%d",n]];
    }
    [_achieveUD registerDefaults:defaultsAchieve];
}

- (void)endMethod {
    [_resultsUD setInteger:_sum forKey:@"sum"];
    [_resultsUD setInteger:_score forKey:@"score"];
    [_resultsUD synchronize];
}

- (void)achievePass {
    int d=[_achieveUD integerForKey:[NSString stringWithFormat:@"achieve%d",t]];
    if (d==0) {
        [_resultsUD setInteger:1 forKey:@"pass"];
    }
}

@end
