//
//  LocationsDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "LocationsDataSource.h"
#import "Location.h"
static LocationsDataSource *sharedDataSource = nil;
@implementation LocationsDataSource
@synthesize locations;
+(LocationsDataSource*)shared {
	if (sharedDataSource == nil) {
		sharedDataSource = [LocationsDataSource new];
	}
	return sharedDataSource;
}
- (void)dealloc {
	[locations release];
	[super dealloc];
}
- (id)init {
	if (self = [super init]) {
		locations = [NSMutableArray new];
		
		Location *loction = [Location new];
		loction.title = @"Los Angeles";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n7033 West Sunset Blvd Suite 318\nLos Angeles, CA 90028\n866-515-2111";
		CLLocationCoordinate2D location = {
			34.0990,-118.3423
		};
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		loction = [Location new];
		loction.title = @"Las Vegas";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n3875 South Jones Blvd Suite 103\nLas Vegas, NV 89103\n702-248-3789";
		location.latitude = 36.118447;    location.longitude = -115.225536;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		loction = [Location new];
		loction.title = @"Memphis";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n2693 Union Ave Ext Suite 101\nMemphis, TN 38112\n866-515-2111";
		location.latitude = 35.135563;    location.longitude = -89.972963;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		loction = [Location new];
		loction.title = @"New York";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n15 Madison Ave 11th Floor\nNew York, NY 10017\n212-986-1929";
		location.latitude = 40.754279;    location.longitude = -73.979015;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		loction = [Location new];
		loction.title = @"Richmond";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n1707 Summit Ave\nRichmond, VA 23230\n804-359-2111";
		location.latitude = 37.568783;    location.longitude = -77.468548;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		loction = [Location new];
		loction.title = @"Virginia Beach Audio";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n161 Business Park Dr Virginia Beach, VA 23462\n757-622-2111";
		location.latitude =36.844418;    location.longitude = -76.17632;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
		
		loction = [Location new];
		loction.title = @"Virginia Beach Video";
		loction.phone = @"";
		loction.adress = @"Studio Center Total Production\n5245 Cleveland St Suite 204 Virginia Beach, VA 23462\n757-420-9195";
		location.latitude = 36.842647;    location.longitude = -76.162430;
		loction.coordinate = location;
		[locations addObject:loction];
		[loction release];
		
	}
	return self;
}

@end
