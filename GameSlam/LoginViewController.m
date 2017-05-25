//
//  LoginViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginDetailViewController.h"
#import "SignUPViewController.h"
#import "DashBoardViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "JSWaiter.h"

@interface LoginViewController ()<UITextFieldDelegate>{

    NSDictionary *tempFB;
    
   NSString* loggedin;
    
    NSString *email;
    NSString *password;
}

@end

@implementation LoginViewController

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

- (IBAction)onclickloginBtn:(id)sender {
    
    LoginDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];

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
- (IBAction)onclickSignupBtn:(id)sender {
    
    email  =   [self.emailText text];
    password = [self.passwordText text];
    
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
    
    //   Success 200 !!!
    NSUserDefaults *defaults = [[NSUserDefaults alloc]  init];
    
    [defaults setObject:email forKey:@"email"];
    [defaults setObject:password forKey:@"password"];
    
    SignUPViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUPViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)onclickFBSignBtn:(id)sender {
    
    FBSDKLoginManager *logIn = [[FBSDKLoginManager alloc] init];
    [logIn logInWithReadPermissions:@[@"public_profile", @"email", @"user_birthday", @"user_photos"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"%@", (NSString *)error);
        }else if (result.isCancelled) {
            NSLog(@"Login Cancelled");
        }else {
            NSLog(@"LogInSuccess");
            
            if ([result.grantedPermissions containsObject:@"email"]) {
                //NSLog(@"result is:%@",result);
                [self fetchUserFacebookInfo];
            }
            
        }
    }];
    
    
}

- (void)fetchUserFacebookInfo {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, link, first_name, last_name, picture.type(large), email, birthday, gender, bio, location, friends, hometown, friendlists"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"facebook fetched info : %@", result);
                 
                 tempFB = (NSDictionary *)result;
                 
                 [self dataRefreshFB];
                 
                 if([commonUtils getUserDefault:@"user_apns_id"] != nil) {
                     
                 } else {
//                     [appController.vAlert doAlert:@"Notice" body:@"OK!" duration:0.3f done:^(DoAlertView *alertView) {
//                         [self navToView];
//                         [commonUtils showActivityIndicatorColored:self.view];
//                     }];
                 }
                 
             } else {
                 NSLog(@"Error %@",error);
             }
         }];
    }
    
   
}

- (void) dataRefreshFB
{
    NSString *username = [tempFB objectForKey:@"name"];
//    NSString *firstname = [tempFB objectForKey:@"first_name"];
//    NSString *lastname = [tempFB objectForKey:@"last_name"];
               email = [tempFB objectForKey:@"email"];
    NSString *gender = [tempFB objectForKey:@"gender"];
   //NSString *link = [tempFB objectForKey:@"link"];

//    
    NSDictionary *photodataURL = [tempFB objectForKey:@"picture"];
    NSDictionary *photodata = [photodataURL objectForKey:@"data"];
    NSString *photoURL = [photodata objectForKey:@"url"];
    
    NSURL* url =[NSURL URLWithString:photoURL];
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    
   // UIImage *profile = [UIImage imageWithData:data];
    
//    NSDictionary *userInfo = @{@"username":username,@"firstName":firstname,@"lastName":lastname,
//                                      @"email":email,@"gender":gender,@"photo":photoURL};
//
//    [commonUtils setUserDefaultDic:@"RegisteredUser" withDic:userInfo];
    //NSMutableDictionary *registeredUserInfo = [commonUtils getUserDefaultDicByKey:@"RegisteredUser"];
    
// login Bool val saving
    
    loggedin = @"1";
    [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
    [commonUtils setUserDefault:@"FBloggedin" withFormat:loggedin];
    NSUserDefaults * defaults = [[NSUserDefaults alloc] init];
    
    [defaults setObject:data forKey:@"photo"];
    [defaults setObject:username forKey:@"username"];
    [defaults setObject:email forKey:@"email"];
    //[defaults setObject:@"" forKey:@"screenname"];
    [defaults setObject:gender forKey:@"gender"];
//    [defaults setObject:referralcode forKey:@"referralcode"];
//    [defaults setObject:address forKey:@"address"];
//    
    
                      /*   To Backend Posing */
    
//    [[DatabaseController sharedManager] registerUser:username byEmail:email byFirstName:firstname byLastName:lastname onSuccess:^(id json){
//        NSLog(@"Database Data : %@", json);
//        NSDictionary *temp = json;
//       onFailure:^(id json){
//        NSLog(@"Database Data1 : %@", json);
//    }];
    
    LoginDetailViewController *otherViewController;
    otherViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginDetailViewController"];
    [self.navigationController pushViewController:otherViewController animated:YES];
}
@end
