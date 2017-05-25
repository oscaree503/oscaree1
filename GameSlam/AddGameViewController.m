//
//  AddGameViewController.m
//  GameSlam
//
//  Created by Jose on 3/18/16.
//  Copyright © 2016 zoltan. All rights reserved.
//

#import "AddGameViewController.h"
#import "GameDetailViewController.h"
#import "DashBoardViewController.h"
#import "VSDropdown.h"


@interface AddGameViewController ()<VSDropdownDelegate>{

    VSDropdown * dropdown;
    NSMutableArray* conditionArray;
}
@property (weak, nonatomic) IBOutlet UILabel *specificationLable;
@property (weak, nonatomic) IBOutlet UIImageView *gameimageView;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *platformLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;

@property (nonatomic, assign) NSUInteger conditions;

@end

@implementation AddGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.switchBtn.tintColor = [UIColor lightGrayColor];
    self.switchBtn.thumbTintColor = [UIColor whiteColor];
    
    //dropdown initializing
    
    dropdown = [[VSDropdown alloc] initWithDelegate:self];
    [dropdown setAdoptParentTheme:YES];
    [dropdown setShouldSortItems:NO];
    
    self.conditions = 0;
    
    conditionArray = [[NSMutableArray alloc] init];
    conditionArray = [@[
                      [@{
                         @"condition_id": @"0",
                         @"condition_name": @" AlmostNew - Used "
                          } mutableCopy],
                      [@{
                         @"condition_id": @"1",
                         @"condition_name": @" VeryGood - Used "
                         }mutableCopy],
                      [@{
                         @"condition_id": @"2",
                         @"condition_name": @" Good - Used "
                         } mutableCopy],
                      [@{
                         @"condition_id": @"3",
                        @"condition_name": @"Acceptable - Used "
                       } mutableCopy],
                      [@{
                         @"condition_id": @"4",
                         @"condition_name":@" N/A "
                         }mutableCopy]
                      ] mutableCopy];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)onDropUp:(id)sender {
    
    [self showDropDownForButton:sender adContents:[self getNameArray:conditionArray] multipleSelection:NO];
    
}
- (NSMutableArray *)getNameArray:(NSMutableArray *)arr {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for(NSMutableDictionary *dic in arr) {
        [names addObject:[@"" stringByAppendingString:[dic objectForKey:@"condition_name"]]];
    }
    return names;
}
- (void)showDropDownForButton:(UIButton *)sender adContents:(NSArray *)contents multipleSelection:(BOOL)multipleSelection {
    
    [dropdown setDrodownAnimation:rand() % 2];
    
    [dropdown setAllowMultipleSelection:multipleSelection];
    
    [dropdown setupDropdownForView:sender];
    
    [dropdown setShouldSortItems:NO];
    //    [dropdown setSeparatorColor:sender.titleLabel.textColor];
    //    [dropdown setSeparatorColor:[UIColor clearColor]];
    [dropdown setTextColor:[UIColor blackColor]];
    
    
    if (dropdown.allowMultipleSelection) {
        [dropdown reloadDropdownWithContents:contents andSelectedItems:[sender.titleLabel.text componentsSeparatedByString:@";"]];
    } else {
        [dropdown reloadDropdownWithContents:contents andSelectedItems:@[sender.titleLabel.text]];
        //        [_dropdown reloadDropdownWithContents:contents keyPath:@"name" selectedItems:@[sender.titleLabel.text]];
    }
    
}


#pragma mark - VSDropdown Delegate methods.

- (void)dropdown:(VSDropdown *)dropDown didChangeSelectionForValue:(NSString *)str atIndex:(NSUInteger)index selected:(BOOL)selected {
    UIButton *btn = (UIButton *)dropDown.dropDownView;
    NSString *allSelectedItems = [dropDown.selectedItems componentsJoinedByString:@";"];
    [btn setTitle:allSelectedItems forState:UIControlStateNormal];
    
    _conditions = [[[conditionArray objectAtIndex:index] objectForKey:@"condition_id"] intValue];
    
}

- (UIColor *)outlineColorForDropdown:(VSDropdown *)dropdown {
    //    UIButton *btn = (UIButton *)dropdown.dropDownView;
    
    //    return btn.titleLabel.textColor;
    return [UIColor grayColor];
}

- (CGFloat)outlineWidthForDropdown:(VSDropdown *)dropdown {
    return 1.0;
}

- (CGFloat)cornerRadiusForDropdown:(VSDropdown *)dropdown {
    return 3.0;
}

- (CGFloat)offsetForDropdown:(VSDropdown *)dropdown {
    return -2.0;
}

- (IBAction)onchangedSwich:(id)sender {
    
    if ([self.switchBtn isOn]) {
        
        self.switchBtn.tintColor = [UIColor redColor];
        self.switchBtn.thumbTintColor = [UIColor whiteColor];
        
        
    }else{
        
        self.switchBtn.tintColor = [UIColor whiteColor];
        self.switchBtn.thumbTintColor = [UIColor lightGrayColor];
    }
    
}
- (IBAction)onclickAddGameBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onclickDoneBtn:(id)sender {
    DashBoardViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
     [self.navigationController pushViewController:vc animated:YES];
}

@end
