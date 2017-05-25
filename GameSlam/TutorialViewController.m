//
//  TutorialViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollview.delegate=self;
    [self.scrollview setContentSize:CGSizeMake( self.view.bounds.size.width * 5
                                               , self.view.bounds.size.height - 20)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page=scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pagecontrol.currentPage=page;
    
    }

- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
    
}
@end
