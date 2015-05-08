//
//  BaseRequest.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseRequest.h"
#import "ASINetworkQueue.h"
#import "ASIDownloadCache.h"

@interface BaseRequest (Private)
-(void)configureRequest:(ASIFormDataRequest*)aRequest;
-(void)didFinishWithError:(ASIFormDataRequest*)aRequest;
-(void)didFinishWithSuccess:(ASIFormDataRequest*)aRequest;
+(ASINetworkQueue*)sharedQueue;
-(NSString*)requestURL;
@end

static ASINetworkQueue *globalQueue = nil;//Global request queue

@implementation BaseRequest
@synthesize delegate, onSuccess, onError;

+(ASINetworkQueue*)sharedQueue {
	if (globalQueue == nil) {
		//Global queue use for all API request
		globalQueue = [ASINetworkQueue new];
		//Set cache for all request
		[ASIHTTPRequest setDefaultCache:[ASIDownloadCache sharedCache]];
	}
	return globalQueue;
}

//Send request
-(void)send {
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[self requestURL]];
	request.delegate = self;
	request.didFinishSelector = @selector(didFinishWithSuccess:);
	request.didFailSelector = @selector(didFinishWithError:);

	[self configureRequest:request];
	
	[[[self class] sharedQueue] addOperation:request];
}

//Configure request
-(void)configureRequest:(ASIFormDataRequest*)aRequest {
	@throw [NSException exceptionWithName:@"Not full implementation" reason:@"You must implement configureRequest: method in your class" userInfo:nil];
}

//Request url, this method must be implemented in inherited classes
-(NSURL*)requestURL {
	return [NSURL URLWithString:@""];
}

//Method call on error request
-(void)didFinishWithError:(ASIFormDataRequest*)aRequest {
	if ([delegate respondsToSelector:onError]) {
		[delegate performSelector:onError withObject:[self resultFromResponse:[aRequest responseString]]];
	}
}

//Method call on successfull request
-(void)didFinishWithSuccess:(ASIFormDataRequest*)aRequest {
	if ([delegate respondsToSelector:onSuccess]) {
		[delegate performSelector:onSuccess withObject:[aRequest error]];
	}
	//Informing other parts of the application of the end of request via global notification center
	NSString *notificationName = [NSString stringWithFormat:@"didFinish_%@",NSStringFromClass([self class])];
	[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self];
}

// get result data
-(id)resultFromResponse:(NSString*)responseString {
	@throw [NSException exceptionWithName:@"Not full implementation" reason:@"You must implement configureRequest: method in your class" userInfo:nil];
	return nil;
}

@end
