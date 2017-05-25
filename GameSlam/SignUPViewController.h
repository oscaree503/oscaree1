//
//  SignUPViewController.h
//  GameSlam
//
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NZCircularImageView.h"




@interface SignUPViewController : UIViewController<UITextFieldDelegate>
- (IBAction)onclickBackBtn:(id)sender;
- (IBAction)onclickMaleBtn:(id)sender;

- (IBAction)onclickFemaleBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;

- (IBAction)onclickPhotoBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;

@property (weak, nonatomic) IBOutlet UITextField *screenNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *AgeTextfield;

@property (weak, nonatomic) IBOutlet UITextField *referralcodeTextfield;

- (IBAction)onclickMapBtn:(id)sender;

@end
