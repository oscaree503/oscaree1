//
//  ContactAdminViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactAdminViewController : UIViewController<UITextViewDelegate>

- (IBAction)onclickBackBtn:(id)sender;
- (IBAction)onclickDone:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *messageText;

@end
