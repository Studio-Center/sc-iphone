    //
//  ContactUsVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactUsVC_Pad.h"
#import "PadNavigator.h"
#import "Location.h"
#import "LocationsDataSource.h"
#import "MapAnotation.h"
@implementation ContactUsVC_Pad
@synthesize map;
#pragma mark -
#pragma mark UITableView DataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[LocationsDataSource shared] locations] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CtName"] autorelease];
    }
	
    Location *location = [[[LocationsDataSource shared] locations] objectAtIndex:indexPath.row];
	
	UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
	header.font = [UIFont fontWithName:@"Helvetica" size:20];
	header.shadowColor = [UIColor grayColor];
	header.shadowOffset = CGSizeMake(1, 1);
	header.text = location.title;
	header.textColor = [UIColor whiteColor];
	header.backgroundColor = [UIColor clearColor];
	[cell.contentView addSubview:header];
	[header release];
	
	UITextView *address = [[UITextView alloc] initWithFrame:CGRectMake(0, 30, 200, 120)];
    address.dataDetectorTypes = UIDataDetectorTypeAll;
    address.editable = NO;
	address.font = [UIFont fontWithName:@"Helvetica" size:13];
	address.backgroundColor = [UIColor clearColor];
	address.text = location.adress;
	address.textColor = [UIColor whiteColor];
	[cell.contentView addSubview:address];
	[address release];
	
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[cell setBackgroundColor:[UIColor clearColor]];
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
	[backgroundView setBackgroundColor:[UIColor clearColor]];
	[cell setSelectedBackgroundView:backgroundView];
	[backgroundView release];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	for (Location *loc in [[LocationsDataSource shared] locations]) {
		MapAnotation *anotation = [[MapAnotation alloc] initWithCoordinate:loc.coordinate title:loc.title];
		[map addAnnotation:anotation];
		[anotation release];
	}
	
	MKCoordinateRegion region;
	region.center.latitude = 42.747012;
	region.center.longitude = -97.382812;
	region.span.latitudeDelta = 49.343732;
	region.span.longitudeDelta = 56.250000;
	map.region = region;
	
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 150;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return YES;
}

@end
