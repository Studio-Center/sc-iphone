//
//  Location.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject {
	NSString *title;
	NSString *adress;
	NSString *phone;
	CLLocationCoordinate2D coordinate;
}
@property (nonatomic, retain) NSString *title, *adress, *phone;
@property CLLocationCoordinate2D coordinate;
@end
