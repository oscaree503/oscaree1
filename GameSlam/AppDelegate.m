//
//  AppDelegate.m
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "DashBoardViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>


#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface AppDelegate (){
    
  

    UINavigationController* navController;
    UIStoryboard* storyboard;
    DashBoardViewController* dashBoardViewController;
    
    
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
-(void)updateLocationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
      [Fabric with:@[[Crashlytics class]]];
     
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    [self updateLocationManager];
    
    NSString * loggedin;
    
    loggedin = [commonUtils getUserDefault:@"loggedin"];
    if ([loggedin isEqualToString:@"1"]) {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        dashBoardViewController = [storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        navController = [[UINavigationController alloc] initWithRootViewController:dashBoardViewController];
        [navController.navigationBar setHidden:YES];
        self.window.rootViewController = navController;
       /// [self.window makeKeyAndVisible];


    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)updateLocationManager {
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager setDistanceFilter:804.17f]; // Distance Filter as 0.5 mile (1 mile = 1609.34m)
    
    if(IS_OS_8_OR_LATER) {
        [locationManager requestAlwaysAuthorization];
    }
    [locationManager startMonitoringSignificantLocationChanges];
    
    
    [locationManager startUpdatingLocation];
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError: %@", error);
    //[commonUtils showAlert:@"Error" withMessage:@"Failed to Get Your Location"];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    NSLog(@"didUpdateToLocation: %@", [locations lastObject]);
    CLLocation *currentLocation = [locations lastObject];
    
    if (currentLocation != nil) {
        BOOL locationChanged = NO;
        if(![commonUtils getUserDefault:@"currentLatitude"] || ![commonUtils getUserDefault:@"currentLongitude"]) {
            locationChanged = YES;
        } else if(![[commonUtils getUserDefault:@"currentLatitude"] isEqualToString:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]] || ![[commonUtils getUserDefault:@"currentLongitude"] isEqualToString:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]]) {
            locationChanged = YES;
        }
        if(locationChanged) {
            [commonUtils setUserDefault:@"currentLatitude" withFormat:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]];
            [commonUtils setUserDefault:@"currentLongitude" withFormat:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]];
            
            [appController.currentUser setObject:[commonUtils getUserDefault:@"currentLatitude"] forKey:@"current_latitude"];
            [appController.currentUser setObject:[commonUtils getUserDefault:@"currentLongitude"] forKey:@"current_longitude"];
        }
    }
    //[locationManager stopUpdatingLocation];
    [self updateUserLocation]; // Aler showing
}

- (void)updateUserLocation {
    
    //for update user's coordinate automatically
    
//        NSString *msg = [NSString stringWithFormat:@"%@:%@", [commonUtils getUserDefault:@"currentLatitude"], [commonUtils getUserDefault:@"currentLongitude"]];
//        [commonUtils showAlert:@"Location Updated" withMessage:msg];
}



@end
