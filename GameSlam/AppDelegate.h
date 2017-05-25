//
//  AppDelegate.h
//  GameSlam
//
//  Created by Streamlined Ingenuity, LLC on 3/3/16.
//  Copyright © 2016 TradeGuru, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>




@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>{
    
    NSString *AddressData;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic ,strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;

@property (nonatomic , strong) CLLocationManager* locationmanager;
@end

