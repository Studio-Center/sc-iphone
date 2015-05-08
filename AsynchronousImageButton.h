//
//  AsynchronousImageView.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIHTTPRequest;
@interface AsynchronousImageButton : UIButton 
{
	UILabel *indicator;
	ASIHTTPRequest *request;
}

- (void)loadImageFromURLString:(NSString *)theUrlString;

@end