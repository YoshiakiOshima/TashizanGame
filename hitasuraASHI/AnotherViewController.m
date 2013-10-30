//
//  AnotherViewController.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/06.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()

@end

@implementation AnotherViewController {
//    ADBannerView *adView;
}

//- (void)bannerViewDidLoadAd:(ADBannerView *)banner
//{
//    [adView setHidden:NO];
////    NSLog(@"show");
//}
//
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
//{
//    [adView setHidden:YES];
////    NSLog(@"hidden");
//}


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
	// Do any additional setup after loading the view.
    
    CGRect rect=[[UIScreen mainScreen] bounds];
    
    if (rect.size.height==568) {
        self.nadView1=[[NADView alloc] initWithFrame:CGRectMake(0, 20, 320, 50)];
        [self.nadView1 setIsOutputLog:NO];
        [self.nadView1 setNendID:@"-----------------------------" spotID:@"------"];
        [self.nadView1 setDelegate:self];
        [self.nadView1 load];
        
    }
    
    _nadView2 = [[NADView alloc] initWithFrame:CGRectMake(0.f, rect.size.height-50, NAD_ADVIEW_SIZE_320x50.width, NAD_ADVIEW_SIZE_320x50.height)];
    // apiKey, spotID をセットする
    [_nadView2 setNendID:@"--------------------------" spotID:@"------"];
    // デリゲートオブジェクトの指定
    [_nadView2 setDelegate:self];
    // 広告のロードを開始
    [_nadView2 load];
    
    
//    // iAdの処理
//    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
//    adView.frame = CGRectOffset(adView.frame, 0, rect.size.height-50);
//    [self.view addSubview:adView];
//    adView.delegate = self;
//    [adView setHidden:YES];
    
//    _ADUnderView.hidden=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.nadView1 setDelegate:nil];
    self.nadView1=nil;
    [_nadView2 setDelegate:nil];
    _nadView2 = nil;
}

- (void)nadViewDidFinishLoad:(NADView *)adView
{
    // NADView を貼り付ける
    [self.view addSubview:_nadView1];
    [self.view addSubview:_nadView2];
}

@end
