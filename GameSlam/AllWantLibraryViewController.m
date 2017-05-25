//
//  AllWantLibrayViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "AllWantLibraryViewController.h"
#import "WantLibraryViewController.h"
#import "BarcodeScanViewController.h"

@interface AllWantLibraryViewController ()

@end

@implementation AllWantLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onclickSearchWantBtn:(id)sender {
    WantLibraryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WantLibraryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)onclickBarcodeBtn:(id)sender {
    BarcodeScanViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BarcodeScanViewController"];
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)onclickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
    
}


@end
