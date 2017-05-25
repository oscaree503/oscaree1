//
//  ScanBarcodeViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "ScanBarcodeViewController.h"
#import "BarcodeScanViewController.h"
#import "WantLibraryViewController.h"

@interface ScanBarcodeViewController ()<UINavigationControllerDelegate>
{

    UINavigationController* navigationController;
}
@property (weak, nonatomic) IBOutlet UIImageView *gameImageView;
@property (weak, nonatomic) IBOutlet UILabel *gamecontentLabel;

@end

@implementation ScanBarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onclickScanAgainBtn:(id)sender {
    BarcodeScanViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    
    [self.navigationController popToViewController:vc animated:YES];
}

- (IBAction)onclickAddToWantBtn:(id)sender {
    
    WantLibraryViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WantLibraryViewController"];
    
    [self.navigationController popToViewController:vc animated:YES];
    
}

@end
