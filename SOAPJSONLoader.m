//
//  SOAPJSONLoader.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 10/14/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import "SOAPJSONLoader.h"
#import "JSON.h"

@implementation SOAPJSONLoader

-(void)finish:(ASIHTTPRequest*)request {
	NSString *responseString = [request responseString];
	
	NSDictionary *result = [responseString JSONValue];
	
	if (result == nil) {
		[self fail:request];
	} else {
		NSLog(@"Load SOPA Request (%@) with response = %@",self.methodName,responseString);
		[delegate performSelector:onSuccess withObject:result];
	}
}

@end
