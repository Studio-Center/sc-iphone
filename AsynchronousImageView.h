//
//  AsynchronousImageView.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIHTTPRequest;

@interface AsynchronousImageView : UIImageView {
	UIActivityIndicatorView *indicator;
	ASIHTTPRequest *request;
}

@end
