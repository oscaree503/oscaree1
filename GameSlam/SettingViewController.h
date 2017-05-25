//
//  SettingViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController<UIScrollViewDelegate>
- (IBAction)onclickBackBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)onclickChangepasswordBtn:(id)sender;
- (IBAction)onclickLogoutBtn:(id)sender;
- (IBAction)onclickDeleteAccountBtn:(id)sender;

// Please add text

@property (weak, nonatomic) IBOutlet UILabel *emailText;
@property (weak, nonatomic) IBOutlet UILabel *fullNameText;
@property (weak, nonatomic) IBOutlet UILabel *screenNameText;
@property (weak, nonatomic) IBOutlet UILabel *passwordText;

@property (weak, nonatomic) IBOutlet UILabel *currentPasswordText;
@property (weak, nonatomic) IBOutlet UILabel *newpasswordText;

@property (weak, nonatomic) IBOutlet UILabel *referralCodeText;
@property (weak, nonatomic) IBOutlet UILabel *freeSwapetext;

@property (weak, nonatomic) IBOutlet UILabel *pointsText;

//logout and delete

@property (weak, nonatomic) IBOutlet UIView *alerbackgroundView;
@property (weak, nonatomic) IBOutlet UIView *deleteaccountView;
@property (weak, nonatomic) IBOutlet UIView *deleteBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *logoutView;

@end
