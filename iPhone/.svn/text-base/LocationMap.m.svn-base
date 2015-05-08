//
//  LocationMap.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "LocationMap.h"
#import "MapAnotation.h"

@implementation LocationMap
@synthesize map;

-(id)initWithLocation:(Location*)aLocation {
	if (self = [super initWithNibName:@"LocationMap" bundle:nil]) {
		location = [aLocation retain];
		self.title = location.title;
	}
	return self;
}

- (IBAction)back:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
	[self.navigationController setNavigationBarHidden:YES];
	[map setZoomEnabled:YES];
    [map setScrollEnabled:YES];
	MKCoordinateRegion region;
	region.center.latitude = 42.747012;
	region.center.longitude = -97.382812;
	region.span.latitudeDelta = 49.343732;
	region.span.longitudeDelta = 56.250000;
	map.region = region;
	MapAnotation *anotation = [[MapAnotation alloc] initWithCoordinate:location.coordinate title:location.title];
	[map addAnnotation:anotation];
	[anotation release];
}

-(void)viewWillAppear:(BOOL)animated {
	
	
}
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
	MKCoordinateRegion region = mapView.region;
}
- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id )annotation
{
	if(annotation == map.userLocation)
    {
		return nil;
    }
    MKPinAnnotationView *pinView = nil;
    
	static NSString *defaultPinID = @"com.invasivecode.pin";
	pinView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
	if ( pinView == nil )
		pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
	pinView.pinColor = MKPinAnnotationColorRed;
	pinView.canShowCallout = YES;
	pinView.animatesDrop = YES;
	
    return pinView;
}
- (void)dealloc {
	map.delegate = nil;
	[map release];
	[location release];
    [super dealloc];
}


@end
