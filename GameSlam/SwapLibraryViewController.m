//
//  SwapLibraryViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import "SwapLibraryViewController.h"
#import "SearchSwapLibraryViewController.h"
#import "BarcodeScanViewController.h"
#import "SuggestGameViewController.h"
#import "SwapLibraryCollectionViewCell.h"

@interface SwapLibraryViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>{

    NSArray* imageArray;
    NSArray* introLabelArray;
    NSArray* platformLabelArray;
}
@property (weak, nonatomic) IBOutlet UIView *barcodeAlertview;

@end

@implementation SwapLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.SwapCollectionView.delegate = self;
    self.SwapCollectionView.dataSource = self;
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
    
    self.barcodeAlertview.hidden = YES;
    
    
    
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
    
    SwapLibraryCollectionViewCell* cell = (SwapLibraryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SwapLibraryCollectionViewCell" forIndexPath:indexPath];
    
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




- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)onclickSearchDBBtn:(id)sender {
     SearchSwapLibraryViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchSwapLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)onclickSearchBtn:(id)sender {
    
    SearchSwapLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchSwapLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onclickBarcodeBtn:(id)sender {
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onclickBarclde_topBtn:(id)sender {
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark Barcode Scan error!!!
- (IBAction)onclickLetusBtn:(id)sender {
    
    SuggestGameViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SuggestGameViewController"];
    
    [self.navigationController popToViewController:vc animated:YES];
}


@end
