//
//  AppDelegate_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AppDelegate_Pad.h"
#import "StartVC_Pad.h"
#import "PadNavigator.h"

@implementation AppDelegate_Pad
@synthesize window, startViewController, basicNavigatorController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    	

    startViewController = [[StartVC_Pad alloc] initWithNibName:@"StartVC_Pad" bundle:nil];
	[startViewController.view setCenter:CGPointMake(384, 522)];
	
	[window addSubview:startViewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

-(void)applicationWillTerminate:(UIApplication *)application {
	[[Favorites shared] synch];
}

- (void)moviePlayBackDidFinish:(NSNotification*)notification {
	[[NSNotificationCenter defaultCenter] postNotificationName:@"playVideo" object:nil];
    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];    
	[moviePlayer.view removeFromSuperview];
}

- (void)dealloc {
	[startViewController release];
    [window release];
    [super dealloc];
}


@end
