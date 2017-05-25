//
//  SearchWantLibraryViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchWantLibraryViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *WantCollectionView;

@end
