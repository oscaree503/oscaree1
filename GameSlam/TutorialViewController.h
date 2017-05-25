//
//  TutorialViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
- (IBAction)onclickBackBtn:(id)sender;

@end
