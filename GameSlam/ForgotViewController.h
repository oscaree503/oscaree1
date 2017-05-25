//
//  ForgotViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/7/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotViewController : UIViewController<UITextFieldDelegate>
- (IBAction)onclickBackBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailtext;

@end
