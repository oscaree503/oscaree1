//
//  ForgotViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/7/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "ForgotViewController.h"

@interface ForgotViewController ()

@end

@implementation ForgotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onclickResetBtn:(id)sender {
    
    
    NSString*resetemail = self.emailtext.text;
    
    if([commonUtils validateEmail:resetemail])
    {
        
    
    }else{
    
        
    }
    
    
    // After setting
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}

#pragma  mark Textfield Delegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField becomeFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
}
@end
