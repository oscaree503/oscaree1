//
//  MapViewController.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    
    CLLocationCoordinate2D currentCentre;
    
    NSString *AddressData;
    
    NSString* street1;
    NSString* street2;
    NSString* city;
    NSString* state;
    NSString* zipcode;
    NSString* country;
    NSString* countrycode;
    
    int currenDist;
    
}
@property(nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, strong) CLGeocoder *geocoder;
@property(nonatomic, strong) CLPlacemark *placemark;
@property(nonatomic, strong) CLLocation* currentLocation;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLGeocoder* myGeocoder;

@property (weak, nonatomic) IBOutlet UIView *preView;

- (IBAction)onclickBackBtn:(id)sender;




@end
