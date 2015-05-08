//
//  GetAudioRequest.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "GetAudioRequest.h"
#import "JSON.h"
#import "Audio.h"

@implementation GetAudioRequest
@synthesize page;
@synthesize sortBy;

-(void)dealloc {
	self.sortBy = nil;
	[super dealloc];
}

-(void)configureRequest:(ASIFormDataRequest*)aRequest {
	[aRequest setPostValue:[NSString stringWithFormat:@"%d",page] forKey:@"page"];
	[aRequest setPostValue:sortBy forKey:@"sortBy"];
}

-(id)resultFromResponse:(NSString*)responseString {
	return [Audio fillFromJSONArray:responseString];
}

@end
