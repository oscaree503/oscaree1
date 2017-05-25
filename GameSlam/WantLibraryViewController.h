//
//  WantLibraryViewController.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WantLibraryViewController : UIViewController
- (IBAction)onclickBackBtn:(id)sender;
- (IBAction)onclickSearchDBBtn:(id)sender;
- (IBAction)onclickBarcodeBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UICollectionView *WantCollectionView;

@end
