//
//  main.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
	[ASIHTTPRequest setDefaultCache:[ASIDownloadCache sharedCache]];
    [pool release];
    return retVal;
}
