//
//  LoginViewController.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright ©2016 TradeGuru, Inc. All rights reserved.

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)onclickloginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)onclickSignupBtn:(id)sender;

- (IBAction)onclickFBSignBtn:(id)sender;

@end
