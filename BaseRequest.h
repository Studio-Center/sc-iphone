//
//  BaseRequest.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

//Base class for API Request
@interface BaseRequest : NSObject {
	id delegate; 
	SEL onSuccess;
	SEL onError;
}
@property (nonatomic, retain) id delegate;
@property (assign) SEL onSuccess;
@property (assign) SEL onError;

-(void)send; // send request 
-(id)resultFromResponse:(NSString*)responseString; // get result data
@end
