//
//  LoginDetailViewController.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginDetailViewController : UIViewController
- (IBAction)onclickBackBtn:(id)sender;
- (IBAction)onclickFBBtn:(id)sender;

- (IBAction)onclickLetMeBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)onclickForgotBtn:(id)sender;

@end
