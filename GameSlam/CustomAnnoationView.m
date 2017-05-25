//
//  CustomAnnoationView.m
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//

#import "CustomAnnoationView.h"

@implementation CustomAnnoationView
-(id)initWithTitle:(NSString*)newTitle Location:(CLLocationCoordinate2D)location{

    self =[super init];
    
    if (self) {
        _title = newTitle;
        _coordinate = location;
    }
    
    return self;
}
-(MKAnnotationView*)annotationView{

    MKAnnotationView* annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotationView"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"Location_Icon"];
    
    return annotationView;
}

@end
