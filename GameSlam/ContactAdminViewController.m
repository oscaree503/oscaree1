//
//  ContactAdminViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "ContactAdminViewController.h"

@interface ContactAdminViewController ()

@end

@implementation ContactAdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onclickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)onclickDone:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}
@end
