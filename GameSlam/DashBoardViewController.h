//
//  DashBoardViewController.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 2016 TradeGuru, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NZCircularImageView.h"
@interface DashBoardViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet NZCircularImageView *photoView;
- (IBAction)onclickPlusBtnSWAP:(id)sender;
- (IBAction)onclickPlusBtnWANT:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *dashScrollView;
@property (weak, nonatomic) IBOutlet UIView *homeView;
- (IBAction)onclickHomeBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *matchesBtn;
- (IBAction)onclickMatchesBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *profileBtn;
- (IBAction)onclickProfileBtn:(id)sender;
- (IBAction)onclickRereshBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *homeLabel;

@property (weak, nonatomic) IBOutlet UILabel *profileLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchlabel;


@property (weak, nonatomic) IBOutlet UIButton *greenBtn;
@property (weak, nonatomic) IBOutlet UILabel *swapLibraryLabel;
- (IBAction)onclickGreenBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *redBtn;
@property (weak, nonatomic) IBOutlet UILabel *wantLibraryLabel;
- (IBAction)onclickRedBtn:(id)sender;

//  Add features
- (IBAction)onclickMoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

- (IBAction)onclickAddSearchBtn:(id)sender;

- (IBAction)onclickProfileDetailBtn:(id)sender;
- (IBAction)onclickSeeAllWantBtn:(id)sender;


//HomeTab property
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

//profileTab property

@property (weak, nonatomic) IBOutlet NZCircularImageView *photoImage2;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel2;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel2;
// alertview property and event defination

@property (weak, nonatomic) IBOutlet UIView *animationBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *AlertView;
@property (weak, nonatomic) IBOutlet UILabel *alertTitle;

// collectionView

@property (weak, nonatomic) IBOutlet UICollectionView *swapLibraryCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionView *wantedLibraryCollectionView;


@end
