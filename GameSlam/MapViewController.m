//
//  MapViewController.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "MapViewController.h"
#import "VSDropdown.h"
#import "PlaceMark.h"
#import "CustomAnnoationView.h"
@interface MapViewController ()<VSDropdownDelegate>
{
    VSDropdown *_dropdown;
 
    NSMutableArray *distanceArray;
    
    PlaceMark* from;
    
    NSInteger selectedVS_Dist;
    
    MKCircle* circle;
    CLLocationCoordinate2D circleCoordinate;

    MKPointAnnotation* annotationViewG;
    
    int j , i;
    
}

@property (weak, nonatomic) IBOutlet UIButton *currentLocationBtn;
@property (nonatomic, assign) NSUInteger distance;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
//    self.mapView.zoomEnabled = YES;
//    self.mapView.scrollEnabled = YES;
//    self.mapView.userInteractionEnabled = YES;
    
    [self.mapView setMapType:MKMapTypeStandard];

    
    _geocoder = [[CLGeocoder alloc] init];
    
    if (_locationManager == nil) {
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.delegate = self;
        
    }
    
    NSString* lat;
    NSString* lon;
    
    lat = [appController.currentUser objectForKey:@"current_latitude"];
    lon = [appController.currentUser objectForKey:@"current_longitude"];
    
    CLLocationDegrees latitudeFromString = [lat doubleValue];
    CLLocationDegrees longitudeFromString = [lon doubleValue];
    _currentLocation = [[CLLocation alloc] initWithLatitude:latitudeFromString longitude:longitudeFromString];

    circleCoordinate = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);

    Place* home = [[Place alloc] init];
    home.latitude =[lat doubleValue];
    home.longitude = [lon doubleValue];
//    home.name = @"test";
    
    from =[[PlaceMark alloc] initWithPlace:home];
    
    from.isMain = 1;
    
     j = 0;   i = 0;
    
    [self getAddressFromCurrentLocation:_currentLocation];
    
    annotationViewG = [[MKPointAnnotation alloc] init];
    annotationViewG.coordinate = circleCoordinate;
    [self.mapView addAnnotation:annotationViewG];
    
    selectedVS_Dist = 1609 * 5 ;

    [self UpdateCirclePosition];
    [_locationManager stopUpdatingLocation];
    
    
    //Dropdown initializing
    
    _dropdown = [[VSDropdown alloc]initWithDelegate:self];
    [_dropdown setAdoptParentTheme:YES];
    [_dropdown setShouldSortItems:NO];
    
    self.distance = 0;
    
    distanceArray = [[NSMutableArray alloc] init];
    distanceArray = [@[[@{
                          @"distance_id" : @"0",
                          @"distance_name" : @" Radius 5 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"1",
                          @"distance_name" : @" Radius 10 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"2",
                          @"distance_name" : @" Radius 15 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"3",
                          @"distance_name" : @" Radius 20 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"4",
                          @"distance_name" : @" Radius 25 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"5",
                          @"distance_name" : @" Radius 30 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"6",
                          @"distance_name" : @" Radius 35 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"7",
                          @"distance_name" : @" Radius 40 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"8",
                          @"distance_name" : @" Radius 45 mil"
                          } mutableCopy],
                       [@{
                          @"distance_id" : @"9",
                          @"distance_name" : @" Radius 50 mil"
                          } mutableCopy]
                       ] mutableCopy];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapRecognizer];
    
}
- (IBAction)onclickHandBtn:(id)sender {
    
    self.preView.hidden = YES;
}
CLGeocoder *geocoder;
CLPlacemark *newSpotPlaceMark, *thePlacemark;
MKRoute *routeDetails;
NSString *addressOfSpot = @"";

#pragma tap drop pin event
-(IBAction)foundTap:(UITapGestureRecognizer *)recognizer
{
        geocoder = [[CLGeocoder alloc] init];
        
        CGPoint point = [recognizer locationInView:self.mapView];
        CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
        
        __block BOOL isGetAdressSuccess;
        
        NSLog(@"Resolving the Address");
        
        __block NSString *returnAddress = @"";
        
        CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:(float)tapPoint.latitude longitude:(float)tapPoint.longitude];
        circleCoordinate = [newLocation coordinate];
    
        NSLog(@"=================================%f,   %f",circleCoordinate.latitude,circleCoordinate.longitude);
    
    [self UpdateCirclePosition];
    
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            //NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil) {
                newSpotPlaceMark = [placemarks lastObject];
                returnAddress = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 newSpotPlaceMark.subThoroughfare, newSpotPlaceMark.thoroughfare,
                                 newSpotPlaceMark.postalCode, newSpotPlaceMark.locality,
                                 newSpotPlaceMark.administrativeArea,
                                 newSpotPlaceMark.country];
                NSLog(@"Tapping Spot: \n%@", returnAddress);
                isGetAdressSuccess = YES;
                
            } else {
                NSLog(@"%@", error.debugDescription);
                isGetAdressSuccess = NO;
                
            }
            if (isGetAdressSuccess) {
                
                //self.addSpotBtn.hidden = NO;
                Place *home = [[Place alloc] init];
                home.name = newSpotPlaceMark.name;
//                appController.newspotName = home.name;
//                home.description = [NSString stringWithFormat:@"%@, %@", newSpotPlaceMark.administrativeArea, newSpotPlaceMark.locality];

            }
            else{
                
//                [commonUtils showVAlertSimple:@"Notification!" body:@"Please tap the location again." duration:1.2];
                
            }
//            self.istapMapView = isGetAdressSuccess;
            
        }];
        
//    }
}

-(void)UpdateCirclePosition
{
    
    //Removing past layouts from MapView
    if(circle != nil)
        [self.mapView removeOverlays: [self.mapView overlays]];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(circleCoordinate,selectedVS_Dist * 2.5,selectedVS_Dist * 2.5);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    circle = [MKCircle circleWithCenterCoordinate:circleCoordinate radius:selectedVS_Dist];
    [self.mapView addOverlay:circle];

    annotationViewG.coordinate = circleCoordinate;
    
    [self.mapView addAnnotation:annotationViewG];
    
    
}
- (IBAction)onDropUp:(id)sender {
    
    [self showDropDownForButton:sender adContents:[self getNameArray:distanceArray] multipleSelection:NO];
    
}
- (IBAction)onclickCurrentBtn:(id)sender {
    [self UpdateCirclePosition];
}

- (NSMutableArray *)getNameArray:(NSMutableArray *)arr {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for(NSMutableDictionary *dic in arr) {
        [names addObject:[@"" stringByAppendingString:[dic objectForKey:@"distance_name"]]];
    }
    return names;
}

-(void)getAddressFromCurrentLocation:(CLLocation*)location{
    
    
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        
        if (error == nil && placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            
            street1 = placemark.subThoroughfare;
            street2 = placemark.thoroughfare;
            city    = placemark.locality;
            state   = placemark.administrativeArea;
            zipcode = placemark.postalCode;
            country = placemark.country;
            countrycode = placemark.ISOcountryCode;
            
            NSString* combinedstreet = [NSString stringWithFormat:@"%@ %@",street1, street2];
            street1 = combinedstreet;
            
            AddressData = [NSString stringWithFormat:@"%@, %@, %@, %@, %@",
                           combinedstreet,
                           placemark.locality,
                           placemark.administrativeArea,
                           placemark.postalCode,
                           placemark.country];
            
            //               placemark.ISOcountryCode
            
            AddressData = [AddressData stringByReplacingOccurrencesOfString:@" (null)," withString:@""];
            AddressData = [AddressData stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
            
            
            NSLog(@"Current location is %@", city);
            
            
            if(city != nil){
            
                [[NSUserDefaults standardUserDefaults]  setObject:city forKey:@"address"];
            }
            //            [JSWaiter HideWaiter];
        }else{
            
            NSLog(@"%@", error.debugDescription);
        }
    }];
    
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

        if(annotation == mapView.userLocation){
        
            return  nil;

        }else{
            MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotationView"];
            
            if(annotationView == nil){
                annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotationView"];
   
            }else{
                annotationView.annotation = annotation;
            }
            annotationView.image = [UIImage imageNamed:@"Location_Icon.png"];
            
            return annotationView;
        }
    
    
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    
    CLLocationCoordinate2D location;
    
    
    if(i == 0){
    
        location.latitude = _currentLocation.coordinate.latitude;
        location.longitude = _currentLocation.coordinate.longitude;
        
        i ++;
     
    }
    else{
    
        location.latitude = userLocation.coordinate.latitude;
        location.longitude = userLocation.coordinate.longitude;
//  updating
        if(j == 0){
        circleCoordinate = userLocation.coordinate;
         [self UpdateCirclePosition];
         NSLog(@"%f  %f",location.longitude, location.latitude);
            j++;
        }
    }
    
   
    
}


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{

    circle = overlay;
    
    MKCircleRenderer* circleView = [[MKCircleRenderer alloc] initWithOverlay:circle];
    circleView.fillColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.15];
    circleView.strokeColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    circleView.lineWidth = 1;
    
    return circleView;
}


-(MKCircle *)addCircleWithRadius:(NSInteger)radius addCircleWith:(CLLocationCoordinate2D)coordinate{
    
   circle = [MKCircle circleWithCenterCoordinate:coordinate radius:radius];
    
    [_mapView addOverlay:circle];
    
    return circle;
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"didFailWithError: %@", error);
    
}



- (IBAction)onclickBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}



- (void)showDropDownForButton:(UIButton *)sender adContents:(NSArray *)contents multipleSelection:(BOOL)multipleSelection {
    
    [_dropdown setDrodownAnimation:rand() % 2];
    
    [_dropdown setAllowMultipleSelection:multipleSelection];
    
    [_dropdown setupDropdownForView:sender];
    
    [_dropdown setShouldSortItems:NO];
    
    [_dropdown setTextColor:[UIColor blackColor]];
    
    
    if (_dropdown.allowMultipleSelection) {
        [_dropdown reloadDropdownWithContents:contents andSelectedItems:[sender.titleLabel.text componentsSeparatedByString:@";"]];
    } else {
        [_dropdown reloadDropdownWithContents:contents andSelectedItems:@[sender.titleLabel.text]];
        
    }
    
}

#pragma mark - VSDropdown Delegate methods.

- (void)dropdown:(VSDropdown *)dropDown didChangeSelectionForValue:(NSString *)str atIndex:(NSUInteger)index selected:(BOOL)selected {
    UIButton *btn = (UIButton *)dropDown.dropDownView;
    NSString *allSelectedItems = [dropDown.selectedItems componentsJoinedByString:@";"];
    [btn setTitle:allSelectedItems forState:UIControlStateNormal];
    
    _distance = [[[distanceArray objectAtIndex:index] objectForKey:@"distance_id"] intValue];
   
    selectedVS_Dist = 1609 * (_distance + 1) * 5;
    
    NSLog(@"%lu, %li",(unsigned long)_distance, (long)selectedVS_Dist);
    
    [self UpdateCirclePosition];

    
}

- (UIColor *)outlineColorForDropdown:(VSDropdown *)dropdown {
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
