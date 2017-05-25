//
//  CustomAnnoationView.h
//  GameSlam
//
//  Created by Created by Streamlined Ingenuity, LLC on 3/6/16.
//  Copyright © 2016 TradeGuru, Inc.. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Mapkit/Mapkit.h"

@interface CustomAnnoationView : NSObject<MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(copy, nonatomic) NSString* title;


-(id)initWithTitle:(NSString*)newTitle Location:(CLLocationCoordinate2D)location;
-(MKAnnotationView*)annotationView;


@end
