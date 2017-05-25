//
//  AllSwapLibrayViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "AllSwapLibraryViewController.h"
#import "SwapLibraryViewController.h"
#import "BarcodeScanViewController.h"
#import "SearchSwapLibraryViewController.h"
@interface AllSwapLibraryViewController ()

@end

@implementation AllSwapLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onclickSwapSearchBtn:(id)sender {
    
    SearchSwapLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchSwapLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onclickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)oncliiclBarcodeBtn:(id)sender {
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
