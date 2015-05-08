//
//  MapAnotation.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface MapAnotation : NSObject <MKAnnotation> {
	NSString *title;
	CLLocationCoordinate2D coordinate;
}
@property (nonatomic, retain) NSString *title;
@property CLLocationCoordinate2D coordinate;
-(id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate  title:(NSString*)aTitle;
@end
