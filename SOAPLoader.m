//
//  SOAPLoader.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/10/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "SOAPLoader.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "NSString+XMLEntities.h"
#define baseURL @"http://api.studiocenter.com/ws.asmx"

@implementation SOAPLoader
@synthesize delegate, onSuccess, onError, methodName;

-(void)dealloc {
	request.delegate = nil;
	[request cancel];
	[request release];
	[super dealloc];
}

- (void)loadMethod:(NSString*)method {
	[self loadMethod:method withParams:nil];
}

- (void)loadMethod:(NSString*)method withParams:(NSDictionary*)params {
	if (method == nil) {
		return;
	}
	self.methodName = method;
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",baseURL,self.methodName]];
	
	request = [[ASIFormDataRequest alloc] initWithURL:url];
	[request setDownloadCache:[ASIDownloadCache sharedCache]];
	[request setAllowCompressedResponse:YES];
	for (NSString *p in [params allKeys]) {
		[request setPostValue:[params valueForKey:p] forKey:p];
	}
	[request setTimeOutSeconds:20.0];
	[request setRequestMethod:@"POST"];
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(finish:)];
	[request setDidFailSelector:@selector(fail:)];
	
	[request start];
}

-(void)finish:(ASIHTTPRequest*)request {
	NSString *responseString = [request responseString];
	id doc = [Element parseXML:responseString];
	NSString *contentString  = [[[[doc selectElement:@"string"] contentsSource] stringByRemovingPercentEscaping] stringByDecodingXMLEntities];
	if (contentString == nil) {
		[self fail:request];
	} else {
		//NSLog(@"Load SOPA Request (%@) with response = %@",self.methodName,responseString);
		[delegate performSelector:onSuccess withObject:contentString];
	}
}

-(void)fail:(ASIHTTPRequest*)fail {
	NSLog(@"fail = %@",[fail responseString]);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Loading error" message:@"Error on loading request" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert autorelease];
	[delegate performSelector:onError];
}

@end
