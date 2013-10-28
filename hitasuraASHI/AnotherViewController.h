//
//  AnotherViewController.h
//  hitasuraASHI
//
//  Created by OSHIMAYOSHIAKI on 2013/10/06.
//  Copyright (c) 2013年 OSHIMAYOSHIAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "NADView.h"

@interface AnotherViewController : UIViewController<NADViewDelegate,ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *ADUnderView;
@property (nonatomic, retain) NADView *nadView1;
@property (nonatomic, retain) NADView *nadView2;


@end
