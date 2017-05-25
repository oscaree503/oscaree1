//
//  TermsViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/10/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "TermsViewController.h"
#import "DashBoardViewController.h"
@interface TermsViewController ()<UITextViewDelegate ,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *helpWebView;

@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation TermsViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    self.helpWebView.delegate = self;   
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"use1" ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_helpWebView loadRequest:request];


    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"SignUpBtn"] isEqualToString:@"1"]) {
        
        self.agreeBtn.hidden = NO;
        self.buttonView.hidden = NO;
        NSString* string = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"SignUpBtn"];
    }else{
    
        self.agreeBtn.hidden = YES;
        self.buttonView.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onclickBackBtn:(id)sender {

    [self.navigationController popViewControllerAnimated: YES];
    
}

- (IBAction)onclickagreeBtn:(id)sender {
    
    self.agreeBtn.hidden = YES;
    self.buttonView.hidden = YES;
    DashBoardViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
    [self.navigationController pushViewController:vc  animated:YES];
}


@end
