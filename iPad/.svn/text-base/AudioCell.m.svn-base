//
//  AudioCell.m
//  SCProduction
//
//  Created by Владимир Шевченко on 18.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioCell.h"
#import "AudioPlayer.h"

@implementation AudioCell
@synthesize play;
-(void)dealloc {
	[self reset:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"resetAudioCells" object:nil];
    [title release];
	self.play = nil;
	[playButton release];
	[super dealloc];
}

- (void) setupState {
	if (isPlaying) {
		[play setImage:[UIImage imageNamed:@"stopnew.png"] forState:UIControlStateNormal];
	} else {
		[play setImage:[UIImage imageNamed:@"playnew.png"] forState:UIControlStateNormal];
	}
}

- (void) setup {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reset:) name:@"resetAudioCells" object:nil];
	
	isPlaying = [[[AudioPlayer shared] currentAudio] isEqual:stuff];
	
	play = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 32, 32)];
	[play addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchDown];
	[[self contentView] addSubview:play];
	
	[self setupState];
	
	title = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 250, 20)];
	[self.contentView addSubview:title];
	title.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];

	if (isIPad) {
		favButton.center = CGPointMake(220, 12);
		title.textColor = [UIColor whiteColor];
	} else {
		//title.textColor = [UIColor blackColor];
		title.textColor = [UIColor whiteColor];
		favButton.center = CGPointMake(295, 12);
	}
	
	title.backgroundColor = [UIColor clearColor];

	NSString *aname = [[(Audio*)stuff author] name];
	if (aname) {
		title.text = [[(Audio*)stuff author] name];
	} else {
		title.text = [stuff name];
	}
	
	[self changeFavButtonState];
}

- (void)select {
	isPlaying = !isPlaying;
	if (isPlaying) {
		[[AudioPlayer shared] playAudio:stuff delegate:nil];
	} else {
		[[AudioPlayer shared] stopAudio];
	}
	[self setupState];
}
	
-(void)reset:(NSNotification*)noticiation {
	if ([noticiation object] != self.stuff || noticiation == nil) {
		isPlaying = NO;
		[self setupState];
	}
}

-(void)didStopPlaying {
	[self select];
}

- (NSInteger) indentationLevel {
	return 2;
}

@end
