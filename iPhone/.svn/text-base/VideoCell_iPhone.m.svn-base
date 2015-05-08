//
//  VideoCell_iPhone.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import "VideoCell_iPhone.h"
#import "Stuff.h"
#import "Video.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AsynchronousImageView.h"
#import "ASIHTTPRequest.h"

@implementation VideoCell_iPhone
@synthesize playButton;

static MPMoviePlayerController *theMovie = nil;

- (void)setup {
	[super setup];
	
	NSArray *nameComponents = [[stuff name] componentsSeparatedByString:@"-"];
	NSString *mainTitle = [nameComponents objectAtIndex:0];
	NSString *secondTitle = @"";
	if ([nameComponents count]>1) {
		secondTitle = [nameComponents objectAtIndex:1];
	}
    
    AsynchronousImageView *img = [[AsynchronousImageView alloc] init];
	[img loadImageFromURLString:[stuff previeURL]];
	img.frame = CGRectMake(4, 4, 64, 64);
    img.contentMode = UIViewContentModeScaleAspectFit;
	[[self contentView] addSubview:img];
	[img release];
	
	
	UIFont* font = [UIFont boldSystemFontOfSize:17];
	
    CGSize textMaxSize = CGSizeMake(220,50);
	
    CGSize textSize = [mainTitle sizeWithFont:font constrainedToSize:textMaxSize lineBreakMode:UILineBreakModeWordWrap];
	
    CGRect textRect = CGRectMake(75.0f, 0.0f, textSize.width, textSize.height);
	
	UILabel *title = [[UILabel alloc] initWithFrame:textRect];
	title.tag = 1;
	title.numberOfLines = 0;
	title.backgroundColor = [UIColor clearColor];
    title.shadowColor = [UIColor grayColor];
	title.textColor = [UIColor whiteColor];
    title.shadowOffset = CGSizeMake(0, 1);
	title.text = mainTitle;
    title.font = font;
	[self.contentView addSubview:title];
	[title release];
	
	UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(75.0f, textRect.size.height, 250, 20)];
	subTitle.tag = 2;
	[subTitle setFont:[UIFont fontWithName:@"Helvetica" size:12]];
	subTitle.backgroundColor = [UIColor clearColor];
	subTitle.textColor = [UIColor whiteColor];
	subTitle.text = secondTitle;
	[self.contentView addSubview:subTitle];
	[subTitle release];
	
	self.accessoryView.frame = CGRectMake(300, 30, 30, 30);
	
	if ([stuff isFavorite]) {
		[self.accessoryView setImage:[UIImage imageNamed:@"barStar.png"] forState:UIControlStateNormal];
	} else {
		[self.accessoryView setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 80, 80);
    [self addSubview:button];
    [button addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
}
-(IBAction)play:(id)sender {

	theMovie = nil;
	
	if (![stuff url]) {
		return;
	}
	NSString *path = [stuff videoPath];
	NSURL *url = [NSURL URLWithString:path];
    theMovie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[NSNotificationCenter defaultCenter] addObserver:[[UIApplication sharedApplication] delegate]  
                                             selector:@selector(moviePlayBackDidFinish:)  
                                                 name:MPMoviePlayerPlaybackDidFinishNotification  
                                               object:theMovie];
	
	theMovie.scalingMode = MPMovieScalingModeAspectFill; 
	[theMovie play];
    theMovie = nil;
}
-(void)moviePlayBackDidFinish:(NSNotification*)notification {
	MPMoviePlayerController *moviePlayer = [notification object];  
	[[NSNotificationCenter defaultCenter] removeObserver:self  
													name:MPMoviePlayerPlaybackDidFinishNotification  
												  object:moviePlayer];  
	
	if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {  
		[moviePlayer.view removeFromSuperview];  
	}  
	
	[moviePlayer release]; 
}

- (IBAction)accessoryClick:(UIButton*)sender {
	if (![stuff isFavorite]) {
		[stuff setIsFavorite:YES];
		[sender setImage:[UIImage imageNamed:@"barStar.png"] forState:UIControlStateNormal];
	} else {
		[stuff setIsFavorite:NO];
		[sender setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
}
-(void)dealloc {
    [theMovie release];
	theMovie = nil;
	[loadImage cancel];
	[loadImage release];
	[super dealloc];
}
@end
