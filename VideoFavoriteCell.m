//
//  VideoFavoriteCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "VideoFavoriteCell.h"
#import "AsynchronousImageView.h"
#import "PadNavigator.h"

@implementation VideoFavoriteCell
- (void) setup {	
	
	AsynchronousImageView *img = [[AsynchronousImageView alloc] init];
	[img loadImageFromURLString:[stuff previeURL]];
	img.frame = CGRectMake(40, 10, 80, 80);
    img.contentMode = UIViewContentModeScaleAspectFit;
	[[self contentView] addSubview:img];
	[img release];
	
	UIButton *play = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
	[play setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
	[play setImage:[UIImage imageNamed:@"stopButton.png"] forState:UIControlStateSelected];
	[play addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchDown];
	play.center = img.center;
	[[self contentView] addSubview:play];
	[play release];
	
	UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 260, 80)];
	title.numberOfLines = 4;
	title.text = [stuff name];
	title.textColor = [UIColor whiteColor];
	title.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:title];
	[title release];
	
	UILabel *length = [[UILabel alloc] initWithFrame:CGRectMake(160, 30, 120, 80)];
	length.text = [stuff length];
	length.textColor = [UIColor whiteColor];
	length.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:length];
	[length release];
	
	if (isIPad) {
		favButton.center = CGPointMake(220, 12);
	} else {
		favButton.center = CGPointMake(295, 12);
		img.frame = CGRectMake(5, 10, 80, 80);
		title.center = CGPointMake(185, 35);
		length.center = CGPointMake(185, 70);
	}
}

-(void)select {
	
	NSString *url = [[stuff url] stringByReplacingOccurrencesOfString:@"~" withString:@""];
	[moviePlayer release];
	moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:[url stringByAppendingString:@".m3u8"]]]; 	
	moviePlayer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	moviePlayer.view.frame = CGRectMake(0,0, 480, 320);
	
	[[PadNavigator sharedNavigator] setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
	
	[[PadNavigator sharedNavigator] presentModalViewController:moviePlayer animated:YES];
	
}
-(void)dealloc {
	[moviePlayer release];
	[super dealloc];
}
@end
