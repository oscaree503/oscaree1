//
//  ViewController.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.scrollview.delegate=self;
    [self.scrollview setContentSize:CGSizeMake( self.view.bounds.size.width * 5
                                               , self.view.bounds.size.height - 20)];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page=scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pagecontrol.currentPage=page;
    
    if (page == 4 ) {
        
        [self.skipButton setTitle:@"Done" forState:UIControlStateNormal];
       
    }else{
    
        [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    }
}
- (IBAction)onclickSkipBtn:(id)sender {
    LoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
