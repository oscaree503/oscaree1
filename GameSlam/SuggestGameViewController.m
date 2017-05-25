//
//  SuggestGameViewController.m

//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "SuggestGameViewController.h"


@interface SuggestGameViewController ()<UITextFieldDelegate>{

    
    NSString* message;
    
}
@property (weak, nonatomic) IBOutlet UITextField *messageText;

@end

@implementation SuggestGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onclickSendBtn:(id)sender {
    
    // To Backend service,gameName sending
    
}
- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma  mark Textfield Delegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField becomeFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    message = self.messageText.text;
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    message = self.messageText.text;
    
    return YES;
}


@end
