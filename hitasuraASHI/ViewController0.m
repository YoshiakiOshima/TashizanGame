//
//  ViewController0.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/14.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "ViewController0.h"

@interface ViewController0 ()

@end

@implementation ViewController0 {
    int xPos;
    int yPos;
    int pos;
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
    xPos=_view1.center.x;
    yPos=_view1.center.y;
    pos=500;
    
    _view2.center=CGPointMake(xPos+pos, yPos);
    _view3.center=CGPointMake(xPos+pos, yPos);
    
	// Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer* swipeLeftGesture1 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeLeft1_2:)];
    swipeLeftGesture1.direction = UISwipeGestureRecognizerDirectionLeft;
    [_view1 addGestureRecognizer:swipeLeftGesture1];
    
    UISwipeGestureRecognizer* swipeLeftGesture2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeLeft2_3:)];
    swipeLeftGesture2.direction = UISwipeGestureRecognizerDirectionLeft;
    [_view2 addGestureRecognizer:swipeLeftGesture2];
    
    UISwipeGestureRecognizer* swipeRightGesture1 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeRight2_1:)];
    swipeRightGesture1.direction = UISwipeGestureRecognizerDirectionRight;
    [_view2 addGestureRecognizer:swipeRightGesture1];
    
    UISwipeGestureRecognizer* swipeRightGesture2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeRight3_2:)];
    swipeRightGesture2.direction = UISwipeGestureRecognizerDirectionRight;
    [_view3 addGestureRecognizer:swipeRightGesture2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushBack00:(UIStoryboardSegue *)segue {
    
}



- (void)view_SwipeLeft1_2:(UISwipeGestureRecognizer *)sender
{
    [self move1_2];
}
- (void)view_SwipeLeft2_3:(UISwipeGestureRecognizer *)sender
{
    [self move2_3];
}
- (void)view_SwipeRight2_1:(UISwipeGestureRecognizer *)sender
{
    [self move2_1];
}
- (void)view_SwipeRight3_2:(UISwipeGestureRecognizer *)sender
{
    [self move3_2];
}



- (IBAction)pushBtn1_2:(id)sender {
    [self move1_2];
}

- (IBAction)pushBtn2_3:(id)sender {
    [self move2_3];
}

- (IBAction)pushBtn2_1:(id)sender {
    [self move2_1];
}

- (IBAction)pushBtn3_2:(id)sender {
    [self move3_2];
}

- (void)move1_2 {
    [UIView animateWithDuration:0.5 animations:^{
        _view1.center=CGPointMake(xPos-pos, yPos);
        _view2.center=CGPointMake(xPos, yPos);
    }];
}
- (void)move2_3 {
    [UIView animateWithDuration:0.5 animations:^{
        _view2.center=CGPointMake(xPos-pos, yPos);
        _view3.center=CGPointMake(xPos, yPos);}];
}
- (void)move2_1 {
    [UIView animateWithDuration:0.5 animations:^{
        _view2.center=CGPointMake(xPos+pos, yPos);
        _view1.center=CGPointMake(xPos, yPos);
    }];
}
- (void)move3_2 {
    [UIView animateWithDuration:0.5 animations:^{
        _view3.center=CGPointMake(xPos+pos, yPos);
    _view2.center=CGPointMake(xPos, yPos);
    }];
}

@end
