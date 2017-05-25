//
//  DashBoardViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//
#import "DashBoardViewController.h"
#import "SwapLibraryViewController.h"
#import "WantLibraryViewController.h"
#import "EditProfileViewController.h"
#import "SettingViewController.h"
#import "ShareFaceViewController.h"

#import "AllSwapLibraryViewController.h"
#import "AllWantLibraryViewController.h"

#import "WantLibraryViewController.h"
#import "SwapLibraryViewController.h"


#import "DashboardSwapCollectionViewCell.h"
#import "DashboardWantedLibraryCollectionViewCell.h"


#import "SearchViewController.h"
#import "BarcodeScanViewController.h"


#import "SearchSwapLibraryViewController.h"
#import "SearchWantLibraryViewController.h"


#import "UserInformation.h"
#import "KxMenu.h"



@interface DashBoardViewController ()<UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    int page;
    
    int alertView_val;
        
    // swapLibrary
    
    NSArray*  swapImageArray;
    NSArray* swapNameArray;
    NSArray* swapNameArray1;
}
@property (weak, nonatomic) IBOutlet UIView *matchView;
@property (weak, nonatomic) IBOutlet UIScrollView *homeViewScroll;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];   
    
    
    self.dashScrollView.delegate = self;
    
    [self.dashScrollView setContentSize:CGSizeMake( self.homeView.bounds.size.width * 3
                                                   , self.matchView.bounds.size.height)];
    self.homeViewScroll.delegate = self;
    [self.homeViewScroll setContentSize:CGSizeMake(self.homeView.bounds.size.width,self.homeView.bounds.size.height)];
    
    NSUserDefaults*defaults = [[NSUserDefaults alloc] init];

    NSData* imageData1 = [defaults dataForKey:@"photo"];
    UIImage *image=[UIImage imageWithData:imageData1];
    
    NSString* screenName = [defaults stringForKey:@"screenname"];
    NSString* username  = [defaults stringForKey:@"username"];
    NSString *address = [defaults stringForKey:@"address"];
    
    if(image != nil){
        self.photoView.image = image;
        self.photoImage2.image = image;
    }else{
    
        NSLog(@"Photo No!");
    }
    if(![screenName isEqualToString:@""]){
        self.nameLabel.text = screenName;
        self.nameLabel2.text = screenName;
    }else if ([username isEqualToString:@""])
    {
        self.nameLabel.text = username;
        self.nameLabel2.text = username;
       
    }
    
    
    if(address != nil){
    
        self.addressLabel.text = address;
        self.addressLabel2.text = address;
    }else{
    
        self.addressLabel.text = @"";
        self.addressLabel2.text = @"";
        
    }

    //home page initializing
    //if(SwapLibraryData != nil)
//    self.greenBtn.hidden = YES;
//    self.swapLibraryLabel.text = @"Swap Library";
    
    //if(WantLibraryData != nil)
//    self.redBtn.hidden = YES;
//    self.wantLibraryLabel.text = @"Want Library";
    
    // more Button frame init
//    const CGFloat W = self.view.bounds.size.width;
//    const CGFloat H = self.view.bounds.size.height;
    
//    _btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.moreBtn.frame = CGRectMake(5, 5, 100, 50);
    
    
    
    self.animationBackgroundView.hidden = YES;
    alertView_val = 0;
    
    // image array init
    swapImageArray = @[@"Tradeguru1.jpg",@"Tradeguru2.jpg",@"Tradeguru3.jpg",@"Tradeguru4.jpg"];
    swapNameArray = @[@"Activition",@"Enter the Matrix",@"Activition",@"Activition"];
    swapNameArray1 = @[@"65430354613213",@"3143213213",@"31321321313",@"321321334313"];
    
    
    self.swapLibraryCollectionView.delegate = self;
    self.wantedLibraryCollectionView.delegate = self;
    self.swapLibraryCollectionView.dataSource = self;
    self.wantedLibraryCollectionView.dataSource = self;

    self.swapLibraryCollectionView.tag = 1;
    self.wantedLibraryCollectionView.tag = 2;

    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    NSUserDefaults*defaults = [[NSUserDefaults alloc] init];
    NSData* imageData1 = [defaults dataForKey:@"photo"];
    UIImage *image=[UIImage imageWithData:imageData1];
    
    NSString* screenName = [defaults stringForKey:@"screenname"];
    NSString* username  = [defaults stringForKey:@"username"];
    NSString *address = [defaults stringForKey:@"address"];
    
    if(image != nil){
        self.photoView.image = image;
        self.photoImage2.image = image;
    }else{
        
        NSLog(@"Photo No!");
    }
    
    if(screenName != nil){
        
        self.nameLabel.text = screenName;
        self.nameLabel2.text = screenName;
        
    }else if (username != nil){
        
        self.nameLabel.text = username;
        self.nameLabel2.text = username;
        
    }
    
    
    if(address != nil){
        
        self.addressLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"address"];
        self.addressLabel2.text = address;
        
    }else{
        self.addressLabel.text = @"";
        self.addressLabel2.text = @"";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    page=scrollView.contentOffset.x/scrollView.frame.size.width;
    
    if (page == 0) {
        
        [self.homeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.matchesBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.profileBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        self.homeLabel.backgroundColor = [UIColor whiteColor];
        self.matchlabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
        self.profileLabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
    }else if (page == 1){
    
        [self.matchesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.profileBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        self.homeLabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
        self.matchlabel.backgroundColor = [UIColor whiteColor];
        self.profileLabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
    }else if (page == 2){
    
        [self.profileBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.matchesBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        self.homeLabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
        self.matchlabel.backgroundColor = [UIColor colorWithRed:0.1176f green:0.5098f blue:0.431f alpha:0.07f];
        self.profileLabel.backgroundColor = [UIColor whiteColor];

    }
    
}
#pragma mark Button Event of Case of Swap&Want Library's Content Empty
- (IBAction)onclickPlusBtnSWAP:(id)sender {
    
    SwapLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SwapLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)onclickPlusBtnWANT:(id)sender {
    WantLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WantLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ScrollView Button Event
- (IBAction)onclickProfileBtn:(id)sender {
    
    CGFloat width = self.view.bounds.size.width * 2;
    
    CGPoint rightPoint = CGPointMake(width, 0);
    
    [self.dashScrollView setContentOffset:rightPoint animated:YES];
    
}

- (IBAction)onclickMatchesBtn:(id)sender {
    CGFloat width = self.view.bounds.size.width;
    
    CGPoint rightPoint = CGPointMake(width, 0);
    
    [self.dashScrollView setContentOffset:rightPoint animated:YES];
    
}
- (IBAction)onclickHomeBtn:(id)sender {
    
    CGFloat width = self.view.bounds.size.width * 0;
    
    CGPoint rightPoint = CGPointMake(width, 0);
    
    [self.dashScrollView setContentOffset:rightPoint animated:YES];

}
#pragma mark Refresh Button Event
- (IBAction)onclickRereshBtn:(id)sender {
    
    
}
#pragma mark See All Button Event

- (IBAction)onclickSeeAllSwapBtn:(id)sender {
    
    SwapLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SwapLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (IBAction)onclickSeeAllWantBtn:(id)sender {
    
        WantLibraryViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WantLibraryViewController"];
    
         [self.navigationController pushViewController:vc animated:YES];
//    [self.navigationController presentViewController:vc animated:NO completion:nil];

}


#pragma mark Add red,green Btn event

- (IBAction)onclickRedBtn:(id)sender {
    
    alertView_val = 2;
    self.animationBackgroundView.hidden = NO;
    self.alertTitle.text = @"Want library";
    
    [UIView animateWithDuration:0.3 animations:^{
        self.AlertView.frame = CGRectMake(self.AlertView.frame.origin.x, self.view.frame.size.height/3, self.AlertView.frame.size.width, self.AlertView.frame.size.height);
    } completion:^(BOOL finished) { }];
    
    

}
- (IBAction)onclickGreenBtn:(id)sender {
    alertView_val = 1;
    self.animationBackgroundView.hidden = NO;
    self.alertTitle.text = @"Swap library";
    
    [UIView animateWithDuration:0.3 animations:^{
        self.AlertView.frame = CGRectMake(self.AlertView.frame.origin.x, self.view.frame.size.height/3, self.AlertView.frame.size.width, self.AlertView.frame.size.height);
    } completion:^(BOOL finished) { }];
    
    
}
#pragma mark Alert Scan Search Barcode Button
- (IBAction)onclickAlertScanBtn:(id)sender {
    
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    //alerview down moving
    [UIView animateWithDuration:0.3 animations:^{
        self.AlertView.frame = CGRectMake(self.AlertView.frame.origin.x, self.view.frame.size.height, self.AlertView.frame.size.width, self.AlertView.frame.size.height);
    } completion:^(BOOL finished) { }];
    
    self.animationBackgroundView.hidden = YES;
    
}


- (IBAction)onclickAlertSearchBtn:(id)sender {
    if(alertView_val == 1){
        SearchSwapLibraryViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchSwapLibraryViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(alertView_val == 2){
        SearchWantLibraryViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchWantLibraryViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.AlertView.frame = CGRectMake(self.AlertView.frame.origin.x, self.view.frame.size.height, self.AlertView.frame.size.width, self.AlertView.frame.size.height);
    } completion:^(BOOL finished) { }];
    
     self.animationBackgroundView.hidden = YES;
}
- (IBAction)onclickAlertCancelBtn:(id)sender {
    
    alertView_val = 1;
    self.animationBackgroundView.hidden = YES;   
    
    [UIView animateWithDuration:0.3 animations:^{
        self.AlertView.frame = CGRectMake(self.AlertView.frame.origin.x, self.view.frame.size.height, self.AlertView.frame.size.width, self.AlertView.frame.size.height);
    } completion:^(BOOL finished) { }];
    
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

#pragma mark Search button event
- (IBAction)onclickAddSearchBtn:(id)sender {
    
    SearchViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:vc animated:NO];
    
}

#pragma mark menu button event

- (IBAction)onclickMoreButton:(id)sender {
    
    
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"Invite Friends"
                     image:nil//[UIImage imageNamed:@"inviteIcon(50).png"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Share App"
                     image:nil//[UIImage imageNamed:@"action_icon@2x.png"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Settings"
                     image:nil//[UIImage imageNamed:@"settings.png"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor whiteColor];
    first.alignment = NSTextAlignmentCenter;
    
    KxMenuItem *second = menuItems[1];
    
    second.foreColor = [UIColor whiteColor];
    
    second.alignment = NSTextAlignmentCenter;
    KxMenuItem *third = menuItems[2];
    
    third.foreColor = [UIColor whiteColor];
    third.alignment = NSTextAlignmentCenter;
    
    
    [ KxMenu setTintColor:[UIColor grayColor]];
    
    
    
    [KxMenu showMenuInView:self.view
                  fromRect:CGRectMake(self.view.bounds.size.width - 45, 20, 35, 30)
                 menuItems:menuItems];
    
    
}
-(void)pushMenuItem:(id)sender{
    
    NSLog(@"Selected MenuItem is %li", (long)userInformation.seletedMenuIndex);
    
    NSInteger menuIndex = userInformation.seletedMenuIndex;
    if(menuIndex == 0){
        
        
    }else if (menuIndex == 1){
        
        ShareFaceViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ShareFaceViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else if (menuIndex == 2){
        
        SettingViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

#pragma mark profile detail Button event

- (IBAction)onclickProfileDetailBtn:(id)sender {
    
    EditProfileViewController*  vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark CollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView.tag== 1) {
        return swapImageArray.count;
    }else if (collectionView.tag == 2){
        return swapImageArray.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (collectionView.tag == 1) {
    
        DashboardSwapCollectionViewCell* cell = (DashboardSwapCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardSwapCollectionViewCell" forIndexPath:indexPath];
    
        cell.nameLabel.text = swapNameArray[indexPath.item];
    
        cell.imageView.image = [UIImage imageNamed:swapImageArray[indexPath.item]];
        cell.contentLabel.text = swapNameArray1[indexPath.item];
    
        return cell;
        
    }else if (collectionView.tag == 2){
    
        DashboardWantedLibraryCollectionViewCell* cell = (DashboardWantedLibraryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardWantedLibraryCollectionViewCell" forIndexPath:indexPath];
        
        cell.imageView.image = [UIImage imageNamed:swapImageArray[indexPath.item]];
        cell.contentLabel.text = swapNameArray[indexPath.item];
        cell.imageNameLabel.text = swapNameArray1[indexPath.item];
        
        return cell;
        
    }
    
    return nil;
    
}
@end
