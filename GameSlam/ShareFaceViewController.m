//
//  ShareFaceViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "ShareFaceViewController.h"

@interface ShareFaceViewController ()

@end

@implementation ShareFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messageText.delegate = self;
    
    [self.messageText becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark Textfield Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField becomeFirstResponder];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    return YES;
}

- (IBAction)onclickBackBtn:(id)sender{
    
    [self.navigationController popViewControllerAnimated: YES];
    
}


@end
