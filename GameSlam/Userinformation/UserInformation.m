//
//  UserInformation.m
//  Vaunt
//
//  Created by PandaSoft on 9/24/15.
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "UserInformation.h"


@implementation UserInformation
static UserInformation *sharedInstance = nil;

+(UserInformation*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (id) init {
    self = [super init];
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    
//    self.longitude = [[self.userDefaults objectForKey:@"LONGITUDE"] stringValue];
//    self.latitude = [[self.userDefaults objectForKey:@"LATITUDE"] stringValue];
//    self.mapAddressData = [[self.userDefaults objectForKey:@"MAPADDRESSDATA"] stringValue];
    
    [self loadSettings];
    return self;
}

- (void)removeInformation
{
    
    self.saved_flag = NO;
//    self.longitude = nil;
//    self.latitude = nil;
//    //self.mapAddressData = nil;
//    
//    [self.userDefaults removeObjectForKey:@"SAVED_FLAG"];
//    [self.userDefaults removeObjectForKey:@"LONGITUDE"];
//    [self.userDefaults removeObjectForKey:@"LATITUDE"];
    //[self.userDefaults removeObjectForKey:@"MAPADDRESSDATA"];

    [self.userDefaults synchronize];
    return;
}

-(void)setLocationInfo:(BOOL)saved_flag latitude:(NSString*)latitude longitude:(NSString*)longitude{
    
    
    self.saved_flag = true;
    self.latitude = latitude;
    self.longitude = longitude;
    
    [self.userDefaults setObject:@YES forKey:@"SAVED_FLAG"];
    
//    [self.userDefaults setObject:latitude forKey:@"LATITUDE"];
//    [self.userDefaults setObject:longitude forKey:@"LONGITUDE"];
    
    [self.userDefaults synchronize];
    
}

- (void)savedIn{

    self.saved_flag = false;
}

- (void)loadSettings {
    
    [self saveSettings];
}

- (void)saveSettings {
    
    [self.userDefaults synchronize];
}

- (void)saveSelectIndexRow:(NSInteger*)selectIndex; {

}
- (void)saveSettingUp{
    
}


- (void)setLang
{
    
}

- (void)removeLang
{
    
}

@end
