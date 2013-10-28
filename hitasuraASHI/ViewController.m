//
//  ViewController.m
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/04.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _playUD=[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaultsResults=[NSMutableDictionary dictionary];
    [defaultsResults setObject:[NSNumber numberWithInt:0] forKey:@"playPass"];
    [_playUD registerDefaults:defaultsResults];
    
    if ([_playUD integerForKey:@"playPass"]==0) {
        _playBtn.hidden=YES;
        _titleBtn.hidden=YES;
    }else {
        _playBtn.hidden=NO;
        _titleBtn.hidden=NO;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushBack:(UIStoryboardSegue *)segue {
//    NSLog(@"aaa");
}

- (IBAction)toItunes:(id)sender {
    NSString *urlString=@"http://yoodev.web.fc2.com/app.html";
    NSURL *url=[NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
    
}

@end
