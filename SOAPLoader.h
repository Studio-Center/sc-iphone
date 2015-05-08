//
//  SOAPLoader.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/10/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Element.h"
#import "ElementParser.h"

@class ASIFormDataRequest;
@interface SOAPLoader : NSObject {
	id delegate;
	SEL onSuccess;
	SEL onError;
	NSString *methodName;
	ASIFormDataRequest *request;
}
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSString *methodName;
@property (assign) SEL onSuccess;
@property (assign) SEL onError;
-(void)loadMethod:(NSString*)method withParams:(NSArray*)params;
-(void)loadMethod:(NSString*)method;
@end
