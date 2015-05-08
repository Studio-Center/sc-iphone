//
//  AppDelegate_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AppDelegate_Phone.h"
#import "SplashVC_Phone.h"
#import <MediaPlayer/MediaPlayer.h>


@implementation AppDelegate_Phone

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    	
	[application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
	
	splashViewController = [[SplashVC_Phone alloc] initWithNibName:@"SplashVC_Phone" bundle:nil];
	
    [window setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPhonebkgd.png"]]];
	[window addSubview:[splashViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *moviePlayer = [notification object];
	
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];
	

    
    // If the moviePlayer.view was added to the view, it needs to be removed
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {
        
        [moviePlayer release];
    }
    
}

-(void)applicationWillTerminate:(UIApplication *)application {
	[[Favorites shared] synch];
}

- (void)dealloc {
	[splashViewController release];
    [window release];
    [super dealloc];
}


@end
