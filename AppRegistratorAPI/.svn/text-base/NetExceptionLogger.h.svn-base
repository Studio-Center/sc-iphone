//
//  NetExceptionLogger.h
//  MargoProject
//
//  Created by Stas Cherednichenko on 13.06.10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UncaughtExceptionHandler.h"

#define EXCEPTION_SUPPORT_URL @"support/exception/"

@interface NetExceptionLogger : NSObject<UncaughtExceptionHandlerProtocol> {

}

- (void)validateAndSaveCriticalApplicationData;
- (void)notificateAboutException:(NSException *)exception;
- (void)uploadScreenshot;
@end
