//
//  GameDetailViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.

#import "GameDetailViewController.h"
#import "AddGameViewController.h"

@interface GameDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *gamespecificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *platformContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end

@implementation GameDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.photoImage.image = [UIImage imageNamed:@"Tradeguru10.jpg"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onclickWantAddBtn:(id)sender {
    
    AddGameViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddGameViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onclickSwapAddBtn:(id)sender {
    
    AddGameViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddGameViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)onclickXBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
