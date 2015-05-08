//
//  AudioPlayer.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AudioPlayer.h"


static AudioPlayer *sharedPlayer = nil;

@implementation AudioPlayer
@synthesize delegate, currentAudio;

+(AudioPlayer*)shared {
	if (sharedPlayer == nil) {
		sharedPlayer = [[AudioPlayer alloc] init];
	}
	return sharedPlayer;
}

-(void)playAudio:(Audio*)audio delegate:(id)aDelegate {
	self.currentAudio = audio;
	
	[self stopAudio];

	NSURL *url = [NSURL URLWithString:audio.url];
	
	
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
	[[NSNotificationCenter defaultCenter]
					addObserver:self
					selector:@selector(playbackStateChanged:)
					name:ASStatusChangedNotification
					object:streamer];
	
	[streamer start];
}

- (void)playbackStateChanged:(NSNotification *)aNotification
{
	if ([streamer isIdle]) {
		self.currentAudio = nil;
		[self stopAudio];
	}
}

- (void)stopAudio
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"resetAudioCells" object:self.currentAudio];	
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
		 removeObserver:self
		 name:ASStatusChangedNotification
		 object:streamer];
		
		[streamer stop];
		[streamer release];
		streamer = nil;
		
		self.delegate = nil;
		self.currentAudio = nil;
	}
}


-(void)dealloc {
	[self stopAudio];
	[super dealloc];
}

@end