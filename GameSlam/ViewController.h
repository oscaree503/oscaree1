//
//  ViewController.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;
- (IBAction)onclickSkipBtn:(id)sender;

@end

