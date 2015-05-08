//
//  NetExceptionLogger.m
//  MargoProject
//
//  Created by Stas Cherednichenko on 13.06.10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "NetExceptionLogger.h"
#import "ScreenshotProvider.h"

@implementation NetExceptionLogger

- (void)validateAndSaveCriticalApplicationData {
	
}

- (void)notificateAboutException:(NSException *)exception {
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@/%@", APP_SUPPORT_URL, EXCEPTION_SUPPORT_URL]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [url release];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"POST"];
    
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

    NSString *params = [[NSString alloc] initWithFormat:@"reason=%@&description=%@&device_uuid=%@&version=%@&bundle_id=%@", [exception reason], [[exception userInfo] description], [[UIDevice currentDevice] uniqueIdentifier], version, bundleId];
    
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [params release];

    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [request release];
    
    [self uploadScreenshot];
}


// TODO: REMOVE THIS TRASH!!!
- (void)uploadScreenshot {
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@/%@picture", APP_SUPPORT_URL, EXCEPTION_SUPPORT_URL]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [url release];

    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"0xKhTmLbOuNdArY";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary, nil];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSData *screenShot = [[ScreenshotProvider sharedScreenshotProvider] takeAScreenShot];

    NSMutableData *paramsData = [NSMutableData data];

    [paramsData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO]];
    [paramsData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"picture\"; filename=\"temp.png\"\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
    [paramsData appendData:[[NSString stringWithFormat:@"Content-Type: image/png\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
    [paramsData appendData:[@"Content-Transfer-Encoding: binary\r\n\r\n" dataUsingEncoding:NSASCIIStringEncoding]];
    [paramsData appendData:screenShot];
    [paramsData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO]];

    [request setHTTPBody:paramsData];

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    [request release];
    [connection start];
    [connection release];
}
 

@end
