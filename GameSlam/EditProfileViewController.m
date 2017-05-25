//
//  EditProfileViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//

#import "EditProfileViewController.h"
#import "MapViewController.h"


@interface EditProfileViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>{
    
    NSString* username;
    NSString* address;
    NSString* age;
    NSString* gender;
    UIImage*  chosenImage;
    
}

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editscrollview.delegate = self;
    self.nameTextfield.delegate = self;
    self.ageTextfield.delegate = self;
    
    NSUserDefaults * defaults = [[NSUserDefaults alloc] init];
    self.photoImageView.image = [[UIImage alloc] initWithData:[defaults dataForKey:@"photo"]];
    
    self.nameTextfield.text = [defaults stringForKey:@"username"];
    self.ageTextfield.text = [defaults stringForKey:@"age"];
    self.cityandRadiusLabel.text = [defaults stringForKey:@"address"];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"username"]);
    NSLog(@"%@",[defaults stringForKey:@"age"]);
    
    NSLog(@"%@",[defaults stringForKey:@"gender"]);
    if ([[defaults stringForKey:@"gender"] isEqualToString:@"Female"]) {
        
        [self selectedFemale];

    }else{
    
        [self selectedMale];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:YES];
    self.cityandRadiusLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"address"];
    
}

- (IBAction)onclickMaleBtn:(id)sender {
    
    [self selectedMale];
    
}

-(void)selectedMale{

    self.maleBtn.backgroundColor=[UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.9];
    
    [self.maleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    self.maleBtn.titleLabel.font
    
    self.femaleBtn.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    
    [self.femaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    gender = @"Male";

    
}
-(void)selectedFemale{

    self.femaleBtn.backgroundColor=[UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.9];
    
    [self.femaleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    self.maleBtn.titleLabel.font
    
    self.maleBtn.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    
    [self.maleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    gender = @"Female";

}

- (IBAction)onclickFemaleBtn:(id)sender {
    
    [self selectedFemale];
}


- (IBAction)onclickBackBtn:(id)sender {
    
        [self.navigationController popViewControllerAnimated: YES];
    
}
- (IBAction)onclickMapBtn:(id)sender {
    
    MapViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark imagepickerviewController
- (IBAction)onclickpickerBtn:(id)sender {
    
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
                                                         handler:^(UIAlertAction * _Nonnull action) {                                                             NSLog(@"Cancel");
                                                             
                                                             [self dismissViewControllerAnimated:YES completion:nil];
                                                             
                                                         }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.photoImageView.image = chosenImage;
    
    NSLog(@"Image is %@",chosenImage);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
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
    age = self.ageTextfield.text;
   
    return YES;
}

#pragma mark Done event

- (IBAction)onclickDoneBtn:(id)sender {

    NSUserDefaults *defaults = [[NSUserDefaults alloc]  init];

    if(chosenImage == nil && [[NSUserDefaults standardUserDefaults] objectForKey:@"photo" ] == nil){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter photo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
     }else if ([self.nameTextfield.text isEqualToString:@"" ]|| self.nameTextfield.text == nil /*|| ![CommonUtils isValidName:self.nameTextfield.text]*/) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter  Screen name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }else if ([self.ageTextfield.text integerValue] > 100 || [self.ageTextfield.text isEqualToString:@""]|| self.ageTextfield.text == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter  your Age correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
    
        if(chosenImage != nil)
        {
            NSData* photodata = UIImageJPEGRepresentation(chosenImage, 1.0);
            
            [defaults setObject:photodata forKey:@"photo"];
        }
    
        if(age != nil)
            [defaults setObject:age forKey:@"age"];
        if( username != nil)
            [defaults setObject:username forKey:@"username"];
        
        if(gender != nil)
            [defaults setObject:gender forKey:@"gender"];
//        if([[NSUserDefaults standardUserDefaults ] objectForKey:@"address"] != nil){
//        
//            [defaults setObject:address forKey:<#(nonnull NSString *)#>]
//        }
    
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

@end
