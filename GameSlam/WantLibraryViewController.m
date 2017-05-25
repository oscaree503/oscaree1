//
//  WantLibraryViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import "WantLibraryViewController.h"
#import "BarcodeScanViewController.h"
#import "SearchWantLibraryViewController.h"
#import "SuggestGameViewController.h"
#import "WantLibraryCollectionViewCell.h"

@interface WantLibraryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UITextFieldDelegate>{

    NSArray* imageArray;
    NSArray* introLabelArray;
    NSArray* platformLabelArray;

}
@property (weak, nonatomic) IBOutlet UIView *barcordErrorAlertView;

@end

@implementation WantLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.WantCollectionView.delegate = self;
    self.WantCollectionView.dataSource = self;
    imageArray = @[@"Tradeguru1.jpg",
                   @"Tradeguru2.jpg",
                   @"Tradeguru3.jpg",
                   @"Tradeguru4.jpg",
                   @"Tradeguru5.jpg",
                   @"Tradeguru6.jpg",
                   @"Tradeguru7.jpg",
                   @"Tradeguru8.jpg",
                   @"Tradeguru9.jpg",
                   @"Tradeguru10.jpg",
                   @"Tradeguru11.jpg",
                   @"Tradeguru12.jpg"];
    
    introLabelArray = @[@"Activision Blizzard 87438 Destiny The Taken     King Playstation 3",
                        @"Activision Blizzard 87438 Destiny The Taken King Xbox 360",
                        @"Activision Blizzard Call of Duty Black OPS 3 Xbox 360",
                        @"Activision Blizzard 87438 Destiny The Taken King Playstation 3",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC",
                        @"Activision Call of Duty: Ghosts-ACTIVISION INC"];
    
    platformLabelArray = @[@"Xbox 360",
                           @"Playstation 3",
                           @"Xbox One",
                           @"Playstation 3",
                           @"Xbox One",
                           @"Playstation 3",
                           @"Xbox One",
                           @"Playstation 3",
                           @"Xbox One",
                           @"Xbox One",
                           @"Playstation 3",
                           @"Xbox One"];
    
//    if (dada.count >0) {
    self.backgroundView.hidden = YES;
//    }else{
    self.backgroundView.hidden = NO;
//}
    self.barcordErrorAlertView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark collectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WantLibraryCollectionViewCell* cell = (WantLibraryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"WantLibraryCollectionViewCell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.item]];
    cell.gameIntroLabel.text = introLabelArray[indexPath.item];
    cell.platformLabel.text = platformLabelArray[indexPath.item];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger seletectItem = indexPath.item;
    NSLog(@"%li",(long)seletectItem);
    
    //    GameDetailViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GameDetailViewController"];
    //    [self.navigationController pushViewController:vc animated:NO];
    
    
}

- (IBAction)onclicksearchBtn:(id)sender {
    
    SearchWantLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchWantLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onclickSearchDBBtn:(id)sender{
    
   SearchWantLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchWantLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark Barcode Event
- (IBAction)onclickBackBtn:(id)sender {
        
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onclickBarcodeTopBtn:(id)sender {
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:NO];
}
- (IBAction)onclickBarcodeBtn:(id)sender{
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:NO];
    
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

#pragma mark scanbarcode Error

- (IBAction)onclickLetusBtn:(id)sender {
    
    SuggestGameViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SuggestGameViewController"];
    [self.navigationController popToViewController:vc animated:YES];
}

@end
