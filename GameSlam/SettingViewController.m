//
//  SettingViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginDetailViewController.h"
#import "LoginViewController.h"

@interface SettingViewController (){

    NSUserDefaults *userInfo ;
    
    NSString *username ;
    
    NSString *email ;
    NSString *password ;
    
}

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.scrollView.delegate = self;
    
    [self.scrollView setContentSize:CGSizeMake( self.view.bounds.size.width
                                               , self.view.bounds.size.height)];
    
    // inputing
    
    userInfo = [[NSUserDefaults alloc] init];
    
    username = [userInfo objectForKey:@"username"];

    email = [userInfo objectForKey:@"email"];
    password = [userInfo objectForKey:@"password"];
    
    if(![email isEqualToString:@""])
        self.emailText.text = email;
    if(![username isEqualToString:@""])
        self.fullNameText.text = username;
    
    
    self.alerbackgroundView.hidden = YES;
    self.deleteBackgroundView.hidden = YES;
    
    self.logoutView.hidden = YES;
    self.deleteaccountView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
}
- (IBAction)onclickChangepasswordBtn:(id)sender {
    
    if (![password  isEqual: @""] || [password isEqualToString:self.newpasswordText.text] || ![self.newpasswordText.text  isEqual: @""]) {
        
        [userInfo setObject:self.newpasswordText.text forKey:@"password"];
        
    }else if([password  isEqual: @""]){
        
        [self.currentPasswordText becomeFirstResponder];
    }else if([self.newpasswordText.text isEqual:@""]){
        
        [self.newpasswordText becomeFirstResponder];
    }
    
}

- (IBAction)onclickLogoutBtn:(id)sender {
    
    self.alerbackgroundView.hidden = NO;
    self.logoutView.hidden = NO;
   
    
}
- (IBAction)onclickDeleteAccountBtn:(id)sender {
    
    self.deleteBackgroundView.hidden = NO;
    self.deleteaccountView.hidden = NO;
    
}
- (IBAction)onclickdeleteNoBtn:(id)sender {
    
    self.deleteBackgroundView.hidden = YES;
    self.deleteaccountView.hidden = YES;
    
}
- (IBAction)onclickdeleteYesBtn:(id)sender {
    
    self.deleteBackgroundView.hidden = YES;
    self.deleteaccountView.hidden = YES;
    
    NSString* loggedin = @"0";
    [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
    [commonUtils setUserDefault:@"FBloggedin" withFormat:loggedin];
    
    NSString* signupBtn = @"0";
    [commonUtils setUserDefault:@"SignUpBtn" withFormat:signupBtn];
    // signup account deleting
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"screenname"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"photo"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"age"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"referralcode"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"address"];
    
    LoginViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)onclicklogoutNoBtn:(id)sender {
    
    self.alerbackgroundView.hidden = YES;
    self.logoutView.hidden = YES;
    
}
- (IBAction)onclicklogoutYesBtn:(id)sender {
    
    self.alerbackgroundView.hidden = YES;
    self.logoutView.hidden = YES;
    
    NSString* loggedin = @"0";
    [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
    [commonUtils setUserDefault:@"FBloggedin" withFormat:loggedin];
    
    NSString* signupBtn = @"0";
    [commonUtils setUserDefault:@"SignUpBtn" withFormat:signupBtn];
    
    LoginDetailViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
