//
//  AsynchronousImageView.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AsynchronousImageView.h"
#import "ASIHTTPRequest.h"

@implementation AsynchronousImageView
- (void)loadImageFromURLString:(NSString *)theUrlString
{
	if (theUrlString == nil) {
		self.image = nil;
		return;
	}
	
	request= [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:theUrlString]];
	request.didFinishSelector = @selector(loadFinished:);
	request.didFailSelector = @selector(loadFailed:);
	request.delegate = self;
	[request start];
	
	indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[indicator setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
	[self addSubview:indicator];
	[indicator startAnimating];
}
-(void)setFrame:(CGRect)aRect {
	[super setFrame:aRect];
	[indicator setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
}

- (void)loadFinished:(ASIHTTPRequest *)request 
{
	[indicator stopAnimating];
	[indicator removeFromSuperview];
	[indicator release];
	indicator = nil;
	self.image = [UIImage imageWithData:[request responseData]];
}

- (void)loadFailed:(ASIHTTPRequest *)request  {

	[indicator stopAnimating];
	[indicator removeFromSuperview];
	[indicator release];
	indicator = nil;
}

-(void)dealloc {
	[request cancel];
	[request release];
	[indicator removeFromSuperview];
    [indicator release];
	[super dealloc];
}
@end
