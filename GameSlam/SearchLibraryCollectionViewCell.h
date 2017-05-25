//
//  SearchLibraryCollectionViewCell.h
//  GameSlam
//
//  Created by Jose on 3/24/16.
//  Copyright © 2016 zoltan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchLibraryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *gameIntroLabel;
@property (weak, nonatomic) IBOutlet UILabel *platformLabel;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@end
