//
//  UserInformation.h
//  Vaunt
//
//  Created by PandaSoft on 9/24/15.
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UserInformation : NSObject

+(UserInformation*)sharedInstance;

@property(nonatomic, assign) int              seletedMenuRow;

@property(nonatomic, assign) NSUserDefaults*  userDefaults;
@property(nonatomic, assign) int              selectedIndexRow;
@property(nonatomic, assign) NSString*        selectedIndexRow_firstName;
@property(nonatomic, assign) NSString*        selectedIndexRow_lastName;

@property(nonatomic, assign) NSInteger*       objectID;

@property(nonatomic, assign) NSString*        givenName;

@property(nonatomic, assign) NSString*        firstName;
@property(nonatomic, assign) NSString*        lastName;
@property(nonatomic, assign) NSString*        nickName;

@property(nonatomic, assign) NSString*        locationdata;

@property(nonatomic, assign) NSString*        organization;
@property(nonatomic, assign) NSString*        notes;
@property(nonatomic, assign) NSString*        group;


@property(nonatomic, assign) NSMutableArray*  phoneNumberArray;
@property(nonatomic, assign) NSMutableArray*  emailArray;
@property(nonatomic, assign) NSMutableArray*  websiteArray;


@property(nonatomic, assign) UIImage*         photo;
@property(nonatomic, assign) NSData*          data;


@property(nonatomic, assign) NSMutableDictionary*    total_Data;



@property(nonatomic, assign) BOOL      saved_flag;

@property(nonatomic, assign) NSString *longitude;
@property(nonatomic, assign) NSString *latitude;


@property(nonatomic, assign) NSString *mapAddressData;

@property(nonatomic, assign) NSString* street1;
@property(nonatomic, assign) NSString* street2;
@property(nonatomic, assign) NSString* city;
@property(nonatomic, assign) NSString* state;
@property(nonatomic, assign) NSString* zipcode;
@property(nonatomic, assign) NSString* country;
@property(nonatomic, assign) NSMutableArray *oldAllContactsArray;



//=====================
@property(nonatomic, assign)NSInteger  seletedMenuIndex;

- (void)removeInformation;
-(void)setLocationInfo:(BOOL)saved_flag latitude:(NSString*)latitude longitude:(NSString*)longitude;
- (void)savedIn;

- (void)saveSettings;
- (void)saveSettingUp;
- (void)removeLang;
- (void)setLang;
- (void)saveSelectIndexRow:(NSInteger*)selectIndex;

@end