//
//  SignUPViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//

#import "SignUPViewController.h"
#import "MapViewController.h"
#import "TermsViewController.h"

#import "UserInformation.h"
#import "JSWaiter.h"
#import "CommonUtils.h"

@interface SignUPViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate>{

    NSString *username;
    NSString *firstname;
    NSString *lastname;
    NSString *email;
    NSString *gender;
    NSString *referralcode;
    NSString *age;
    
    NSString *screenname;
    NSString *address;
}

@property(strong, nonatomic) UIImage* chosenImage;

@end

@implementation SignUPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JSWaiter HideWaiter];
    
    self.photoImageView.image = [UIImage imageNamed:@"circle.png"];
    
    self.nameTextfield.delegate = self;
    self.screenNameTextfield.delegate = self;
    self.AgeTextfield.delegate = self;
    self.referralcodeTextfield.delegate = self;
    
    gender = @"Female";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark Male and Femail Button
- (IBAction)onclickMaleBtn:(id)sender {
    
    self.maleBtn.backgroundColor=[UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.9];
    
    [self.maleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.maleBtn.titleLabel.font
    
    self.femaleBtn.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    
    [self.femaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    gender = @"Male";
    
}

- (IBAction)onclickFemaleBtn:(id)sender {
    
    self.femaleBtn.backgroundColor=[UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.9];
    
    [self.femaleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    self.maleBtn.titleLabel.font
    
    self.maleBtn.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    
    [self.maleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    gender = @"Female";
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

    username = self.nameTextfield.text;
    screenname = self.screenNameTextfield.text;
    age = self.AgeTextfield.text;
    referralcode = self.referralcodeTextfield.text;
    
    return YES;
}

#pragma mark ImagePicker delegate

- (IBAction)onclickPhotoBtn:(id)sender {
    
    self.photoBtn.hidden = YES;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Take Photo from Photo Libray" style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            NSLog(@"Photo");
                                                            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                            picker.delegate = self;
                                                            picker.allowsEditing = YES;
                                                            
                                                            
                                                            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                            [self presentViewController:picker animated:YES completion:nil];
                                                            
                                                            
                                                        }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Take Photo from Camera" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Camera");
                                                             UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                             picker.delegate = self;
                                                             picker.allowsEditing = YES;
                                                                                                                          
                                                             
                                                             picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                             [self presentViewController:picker animated:YES completion:nil];
                                                             
                                                             
                                                         }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Cancel");
                                                             
                                                           
                                                             [self dismissViewControllerAnimated:YES completion:nil];
                                                             
                                                         }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [alert addAction:cancelAction];    
    
    [self presentViewController:alert animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    _chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.photoImageView.image = _chosenImage;
    
    NSLog(@"Image is -----------------------------------------%@",_chosenImage);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)onclickMapBtn:(id)sender {
    
    MapViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark Done Btn event
- (IBAction)onclickDoneBtn:(id)sender {
    
    address = [[NSUserDefaults standardUserDefaults ] objectForKey:@"address"];
    
    NSData *imageData = UIImageJPEGRepresentation(_chosenImage, 1.0);
    NSUserDefaults*defaults = [[NSUserDefaults alloc] init];
    
    if (_chosenImage == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter Photo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }else if ([self.nameTextfield.text isEqualToString:@"" ]|| self.nameTextfield.text == nil /* || ![CommonUtils isValidName:self.nameTextfield.text]*/) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter Username." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }else if ([self.screenNameTextfield.text isEqualToString:@"" ]|| self.screenNameTextfield.text == nil /* || ![CommonUtils isValidName:self.screenNameTextfield.text]*/) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter your Screen name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
    else if ([address isEqualToString:@"" ]|| address == nil ) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please select  Address Info." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else if ([self.AgeTextfield.text integerValue] > 100 || [self.AgeTextfield.text isEqualToString:@""]|| self.AgeTextfield.text == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter  your Age correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else if ([self.referralcodeTextfield.text isEqualToString:@""] || self.referralcodeTextfield.text == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter  Referral Code correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
    
        //====== UserDefault  Saving ======
        [defaults setObject:imageData forKey:@"photo"];
        [defaults setObject:username forKey:@"username"];
        [defaults setObject:screenname forKey:@"screenname"];
        [defaults setObject:age forKey:@"age"];
        [defaults setObject:referralcode forKey:@"referralcode"];
        [defaults setObject:address forKey:@"address"];
        //========== Saving of Loggedin Val =====================
        
        NSString* loggedin = @"1";
        NSString* signupBtn = @"1";
        [commonUtils setUserDefault:@"loggedin" withFormat:loggedin];
        [commonUtils setUserDefault:@"SignUpBtn" withFormat:signupBtn];
        
         TermsViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TermsViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark BackNavigation
- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
}
@end
