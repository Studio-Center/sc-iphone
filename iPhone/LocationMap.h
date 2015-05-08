//
//  LocationMap.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>

@interface LocationMap : UIViewController <MKMapViewDelegate> {
	Location *location;
	MKMapView *map;
}
@property (nonatomic, retain) IBOutlet MKMapView *map;
-(id)initWithLocation:(Location*)aLocation;
- (IBAction)back:(id)sender;
@end
