//
//  AsynchronousImageView.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AsynchronousImageButton.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
#import "ASINetworkQueue.h"

static ASINetworkQueue *loadingQueue = nil;

@implementation AsynchronousImageButton
+(void)initialize {
	loadingQueue = [ASINetworkQueue new];
	[loadingQueue setMaxConcurrentOperationCount:2];
}
- (void)loadImageFromURLString:(NSString *)theUrlString
{
	if (theUrlString == nil) {
		[self setBackgroundImage:[UIImage imageNamed:@"noavatar.jpeg"] forState:UIControlStateNormal];
		return;
	}
	request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:theUrlString]];
	request.queue = loadingQueue;

	request.didFinishSelector = @selector(loadFinished:);
	request.didFailSelector = @selector(loadFailed:);
	request.delegate = self;
	[request start];
	
	indicator = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	indicator.backgroundColor = [UIColor clearColor];
	indicator.textColor = [UIColor whiteColor];
	
	indicator.center = CGPointMake(self.frame.size.width/2+22, self.frame.size.height/2);
	indicator.font = [UIFont systemFontOfSize:12];
	indicator.text = @"Loading...";
	
	[self addSubview:indicator];
	[indicator release];
}

- (void)loadFinished:(ASIHTTPRequest *)aRequest 
{
	[indicator removeFromSuperview];
	[self setBackgroundImage:[UIImage imageWithData:[request responseData]] forState:UIControlStateNormal];
	if (![request responseData]) {
		[self setBackgroundImage:[UIImage imageNamed:@"noavatar.jpeg"] forState:UIControlStateNormal];
	}
    [self clearRequest];
}

- (void)loadFailed:(ASIHTTPRequest *)aRequest  {

	[indicator removeFromSuperview];
    [self clearRequest];
}

- (void)clearRequest {
    request.delegate = nil;
	[request cancel];
	[request release];
    request = nil;
}

-(void)dealloc {
	[self clearRequest];
	[super dealloc];
}
@end
