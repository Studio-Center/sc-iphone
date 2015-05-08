//
//  MapAnotation.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "MapAnotation.h"


@implementation MapAnotation
@synthesize coordinate, title;
-(id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate  title:(NSString*)aTitle {
	if (self = [super init]) {
		title = aTitle;
		coordinate = aCoordinate;
	}
	return self;
}
-(void)dealloc {
	[title release];
	[super dealloc];
}
@end
