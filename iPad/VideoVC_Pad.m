//
//  VideoVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideoVC_Pad.h"
#import "PadNavigator.h"

@implementation VideoVC_Pad
@synthesize videoCell, prevButton, dataSource, tableView, currentVideo;

- (IBAction)buttonClick:(id)sender {
	
	[self stopPlay];
	[prevButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	UIButton *button = (UIButton*)sender;
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	prevButton = button;
	dataSource.methodName = [methods objectAtIndex:[sender tag]];
	[dataSource load];
}

#pragma mark -
#pragma mark UITableView DataSource methods

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self stopPlay];
}

-(void)stopPlay {
	UIView *view = [self.view viewWithTag:666];
	[view removeFromSuperview];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"playVideo" object:nil];
	if (moviePlayer) {
		[moviePlayer pause];
		[moviePlayer stop];
		
        moviePlayer.initialPlaybackTime = -1.0;
        [moviePlayer.view removeFromSuperview];
        [moviePlayer release];
        moviePlayer = nil;
	}
}

-(void)playVideo:(Video*)video {
	currentVideo = video;
	
	[self stopPlay];
	
		[moviePlayer.view removeFromSuperview];
		[moviePlayer release];
		NSString *url = [[video url] stringByReplacingOccurrencesOfString:@"~" withString:@""];
		moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:[url stringByAppendingString:@".m3u8"]]]; 	
        [[NSNotificationCenter defaultCenter] addObserver:[[UIApplication sharedApplication] delegate]  
                                                 selector:@selector(moviePlayBackDidFinish:)  
                                                     name:MPMoviePlayerPlaybackDidFinishNotification  
                                                   object:moviePlayer];
		
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(startPlay:)  
												 name:MPMoviePlayerContentPreloadDidFinishNotification
											   object:moviePlayer];

		[moviePlayer prepareToPlay]; 
		[moviePlayer play]; 
		moviePlayer.view.frame = CGRectMake(20, 109, 728, 361);
		
		
		
		[self.view addSubview:moviePlayer.view];
		
		UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
		indicator.tag = 666;
		indicator.center = moviePlayer.view.center;
		[self.view addSubview:indicator];
		[indicator release];
		[indicator startAnimating];
	
}


-(void)startPlay:(NSNotification*)notification {
	UIView *view = [self.view viewWithTag:666];
	[view removeFromSuperview];
}
#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopPlay) name:@"stopVideo" object:nil];
	methods = [NSMutableArray new];
	[methods addObject:@"getTVSpots"];
	[methods addObject:@"getMotionGraphics"];
	[methods addObject:@"getLongForm"];
	[methods addObject:@"getPreProduced"];
	[methods addObject:@"getOurReels"];
	
	dataSource = [VideoDataSource new];
	dataSource.methodName = @"getTVSpots";
	dataSource.tableView = tableView;
	dataSource.delegate = self;
	[dataSource load];
}
-(void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"stopVideo" object:nil];
	[super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}

@end
