//
//  UncaughtExceptionHandler.h
//  UncaughtExceptions
//
//  Created by Matt Gallagher on 2010/05/25.
//  Copyright 2010 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import <UIKit/UIKit.h>

@protocol UncaughtExceptionHandlerProtocol

@required - (void)validateAndSaveCriticalApplicationData;
@required - (void)notificateAboutException:(NSException *)exception;

@end


@interface UncaughtExceptionHandler : NSObject<UncaughtExceptionHandlerProtocol> {
	BOOL dismissed;
    id<UncaughtExceptionHandlerProtocol> delegate;
    
    NSDate *startTime;
}


@property (nonatomic, retain) NSDate *startTime;
@property (nonatomic, retain) id<UncaughtExceptionHandlerProtocol> delegate;

+ (NSArray *)backtrace;
- (void)handleException:(NSException *)exception;
- (void)installUncaughtExceptionHandler;
+ (void)installUncaughtExceptionHandler;
- (void)dismissException;

- (void)validateAndSaveCriticalApplicationData;
- (void)notificateAboutException:(NSException *)exception;

- (void)alertView:(UIAlertView *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex;

+ (UncaughtExceptionHandler *)sharedUncaughtExceptionHandler;
+ (id)allocWithZone:(NSZone *)zone;
- (id)copyWithZone:(NSZone *)zone;
- (id)retain;
- (NSUInteger)retainCount;
- (void)release;
- (id)autorelease;

@end
