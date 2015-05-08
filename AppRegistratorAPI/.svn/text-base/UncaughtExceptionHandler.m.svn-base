//
//  UncaughtExceptionHandler.m
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

#import "UncaughtExceptionHandler.h"
#import "NetExceptionLogger.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>

NSString * const UncaughtExceptionHandlerSignalExceptionName = @"UncaughtExceptionHandlerSignalExceptionName";
NSString * const UncaughtExceptionHandlerSignalKey = @"UncaughtExceptionHandlerSignalKey";
NSString * const UncaughtExceptionHandlerAddressesKey = @"UncaughtExceptionHandlerAddressesKey";
NSString * const UncaughtExceptionHandlerSystemNameKey = @"UncaughtExceptionHandlerSystemNameKey";
NSString * const UncaughtExceptionHandlerSystemVersionKey = @"UncaughtExceptionHandlerSystemVersionKey";

volatile int32_t UncaughtExceptionCount = 0;
const int32_t UncaughtExceptionMaximum = 10;

const NSInteger UncaughtExceptionHandlerSkipAddressCount = 4;
const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;

void HandleException(NSException *exception);
void SignalHandler(int signal);
void InstallUncaughtExceptionHandler();

void HandleException(NSException *exception) {
	int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
	if (exceptionCount > UncaughtExceptionMaximum) {
		return;
	}
	
	NSArray *callStack = [UncaughtExceptionHandler backtrace];
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];
    [userInfo setObject:[[UIDevice currentDevice] systemName] forKey:UncaughtExceptionHandlerSystemNameKey];
    [userInfo setObject:[[UIDevice currentDevice] systemVersion] forKey:UncaughtExceptionHandlerSystemVersionKey];
	[userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
	
	[[UncaughtExceptionHandler sharedUncaughtExceptionHandler] performSelectorOnMainThread:@selector(handleException:) withObject: [NSException exceptionWithName:[exception name] reason:[exception reason] userInfo:userInfo] waitUntilDone:YES];
}

void SignalHandler(int signal) {
	int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
	if (exceptionCount > UncaughtExceptionMaximum) {
		return;
	}
	
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey];
    
	NSArray *callStack = [UncaughtExceptionHandler backtrace];
	[userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
	
	[[UncaughtExceptionHandler sharedUncaughtExceptionHandler] performSelectorOnMainThread:@selector(handleException:) withObject:[NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName reason:[NSString stringWithFormat:@"Signal %d was raised.", signal] userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey]] waitUntilDone:YES];
}

void InstallUncaughtExceptionHandler() {
	NSSetUncaughtExceptionHandler(&HandleException);
	signal(SIGABRT, SignalHandler);
	signal(SIGILL, SignalHandler);
	signal(SIGSEGV, SignalHandler);
	signal(SIGFPE, SignalHandler);
	signal(SIGBUS, SignalHandler);
	signal(SIGPIPE, SignalHandler);
}

@implementation UncaughtExceptionHandler

static NSException *lastException = nil;

@synthesize delegate, startTime;

- (id)init {
    if (self = [super init]) {
        [self setDelegate:self];
        [self setStartTime:[NSDate dateWithTimeIntervalSinceNow:0]];
    }
    return self;
}

+ (NSArray *)backtrace {
	 void *callstack[128];
	 int frames = backtrace(callstack, 128);
	 char **strs = backtrace_symbols(callstack, frames);
	 
	 int i = 0;
	 NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
	 for (i = UncaughtExceptionHandlerSkipAddressCount; i < UncaughtExceptionHandlerSkipAddressCount + UncaughtExceptionHandlerReportAddressCount;i++) {
	 	[backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
	 }
	 free(strs);
	 
	 return backtrace;
}

- (void)alertView:(UIAlertView *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex {
	if (anIndex == 0) {
		dismissed = YES;
	} else if (anIndex == 2) {
        [anAlertView dismissWithClickedButtonIndex:BEAST_VALUE animated:NO];
        [self performSelector:@selector(netReport) withObject:nil afterDelay:1];
    }

}

- (void)netReport {
    NetExceptionLogger *logger = [[NetExceptionLogger alloc] init];
    [logger notificateAboutException:lastException];
    [logger release];
}

- (void)validateAndSaveCriticalApplicationData {
	
}

- (void)dismissException {
    dismissed = YES;
}

- (void)notificateAboutException:(NSException *)exception {
    [lastException release];
    lastException = [exception retain];
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Unhandled exception" message:[NSString stringWithFormat:@"You can try to continue but the application may be unstable.\n\nDebug details follow:\n%@\n%@", [exception reason], [[exception userInfo] objectForKey:UncaughtExceptionHandlerAddressesKey]] delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Continue", @"Report", nil] autorelease];
	[alert show];
}

- (void)handleException:(NSException *)exception {
	[[self delegate] validateAndSaveCriticalApplicationData];
	[[self delegate] notificateAboutException:exception];
	
	CFRunLoopRef runLoop = CFRunLoopGetCurrent();
	CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
	
	while (!dismissed) {
		for (NSString *mode in (NSArray *)allModes) {
			CFRunLoopRunInMode((CFStringRef)mode, 0.001, false);
		}
	}
	
	CFRelease(allModes);

	NSSetUncaughtExceptionHandler(NULL);
	signal(SIGABRT, SIG_DFL);
	signal(SIGILL, SIG_DFL);
	signal(SIGSEGV, SIG_DFL);
	signal(SIGFPE, SIG_DFL);
	signal(SIGBUS, SIG_DFL);
	signal(SIGPIPE, SIG_DFL);
	
	if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName]) {
        kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey] intValue]);
	} else {
		[exception raise];
	}
}

- (void)installUncaughtExceptionHandler {
    InstallUncaughtExceptionHandler();
}

+ (void)installUncaughtExceptionHandler {
    [[UncaughtExceptionHandler sharedUncaughtExceptionHandler] installUncaughtExceptionHandler];
}

#pragma mark SINGLETON METHODS

static UncaughtExceptionHandler *sharedUncaughtExceptionHandler = nil;

+ (UncaughtExceptionHandler *)sharedUncaughtExceptionHandler {
    @synchronized(self) {
        if (sharedUncaughtExceptionHandler == nil) {
            [[self alloc] init];
        }
    }
    return sharedUncaughtExceptionHandler;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedUncaughtExceptionHandler == nil) {
            sharedUncaughtExceptionHandler = [super allocWithZone:zone];
            return sharedUncaughtExceptionHandler;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (void)release {
} 

- (id)autorelease { 
    return self;
}


@end
