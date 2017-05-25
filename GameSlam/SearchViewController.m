//
//  SearchViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchLibraryCollectionViewCell.h"
#import "GameDetailViewController.h"


@interface SearchViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate>
{

    NSArray* imageArray;
    NSArray* introLabelArray;
    NSArray* platformLabelArray;
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *SearchCollectionView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.SearchCollectionView.delegate = self;
    self.SearchCollectionView.dataSource = self;
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
    
    [self.searchText becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchLibraryCollectionViewCell* cell = (SearchLibraryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchLibraryCollectionViewCell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.item]];
    cell.gameIntroLabel.text = introLabelArray[indexPath.item];
    cell.platformLabel.text = platformLabelArray[indexPath.item];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger seletectItem = indexPath.item;
    NSLog(@"%li",(long)seletectItem);
    
    GameDetailViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GameDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
