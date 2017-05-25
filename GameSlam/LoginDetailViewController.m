//
//  LoginDetailViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//x

#import "LoginDetailViewController.h"
#import "DashBoardViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ForgotViewController.h"
#import "JSWaiter.h"

@interface LoginDetailViewController ()<UITextFieldDelegate>{

    NSString *loggedin;
}

@end

@implementation LoginDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.emailText.delegate = self;
    self.passwordText.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
      
}

- (IBAction)onclickFBBtn:(id)sender {
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"FBloggedin"] isEqualToString:@"1"]) {
        
        UIViewController *otherViewController;
        otherViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        [self.navigationController pushViewController:otherViewController animated:YES];

    }else{
    
        FBSDKLoginManager *logIn = [[FBSDKLoginManager alloc] init];
        [logIn logInWithReadPermissions:@[@"public_profile",@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            
            NSLog(@"%@", (NSString *)error);
            
        }else if (result.isCancelled) {
            
            NSLog(@"Login Cancelled");
            
            loggedin = @"0";
            
            [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
            
        }else {
            NSLog(@"LogInSuccess");
            
            [self loggedinInfoSaving];
            
                UIViewController *otherViewController;
                otherViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
                [self.navigationController pushViewController:otherViewController animated:YES];
            
        }
    
      }];
    
    }
}

-(void)loggedinInfoSaving{

    loggedin = @"1";
    
    [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
}

- (IBAction)onclickLetMeBtn:(id)sender {
    
    NSString* email  =   [self.emailText text];
    NSString* password = [self.passwordText text];
    
    if ([email isEqualToString:@""] || [email isEqual:nil]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Email is empty." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }else if ([password isEqualToString:@""] || [password isEqual:nil] || password.length <= 5 ){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter password again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }else if ([commonUtils  validateEmail:email]){
        
        [JSWaiter ShowWaiter:self.view title:@"Signing in..." type:0];
        
        [self performSelector:@selector(signUpwithBackend) withObject:nil afterDelay:0.5];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter Email correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }    
    
}


-(void)signUpwithBackend{

    
    // Interacting wiht services
    
    [self loggedinInfoSaving];
    
    DashBoardViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
    [self.navigationController pushViewController:vc animated:YES];

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

- (IBAction)onclickForgotBtn:(id)sender {
    
    ForgotViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
