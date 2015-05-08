//
//  ScreenshotProvider.m
//  AppRegistratorAPI
//
//  Created by Stas Cherednichenko on 24.07.10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "ScreenshotProvider.h"


@implementation ScreenshotProvider

- (NSData *)takeAScreenShot {

    UIView *keyView = [[UIApplication sharedApplication] keyWindow];
	UIGraphicsBeginImageContext(keyView.frame.size);	
    
	[keyView.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(viewImage);
}


static ScreenshotProvider *sharedScreenshotProvider = nil;

+ (ScreenshotProvider *)sharedScreenshotProvider {
    @synchronized(self) {
        if (sharedScreenshotProvider == nil) {
            [[self alloc] init];
        }
    }
    return sharedScreenshotProvider;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedScreenshotProvider == nil) {
            sharedScreenshotProvider = [super allocWithZone:zone];
            return sharedScreenshotProvider;
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
