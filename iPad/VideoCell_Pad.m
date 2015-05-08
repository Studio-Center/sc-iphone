//
//  VideoCell_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 30.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideoCell_Pad.h"


@implementation VideoCell_Pad
@synthesize leftTileLabel, rightTitleLabel, leftMiddleLabel, rightMiddleLabel, leftBottomLabel, rightBottomLabel, fav1, fav2;
@synthesize playButton1, playButton2, image1, image2;
#pragma mark -
#pragma mark UITableViewCell methods

- (void)setRow:(NSArray*)row  {
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	if ([row count] > 0) {
		firstVideo = [[row objectAtIndex:0] retain];
		[image1 loadImageFromURLString:[firstVideo previeURL]];
		
		playButton2.hidden = NO;
		rightTitleLabel.hidden = NO;
		fav2.hidden	= NO;
		leftBottomLabel.hidden = NO;
		
		if ([row count] == 2) {
			secondVideo = [[row objectAtIndex:1] retain];
			[image2 loadImageFromURLString:[secondVideo previeURL]];
		} else {
			playButton2.hidden = YES;
			rightTitleLabel.hidden = YES;
			fav2.hidden	= YES;
			leftBottomLabel.hidden = YES;
		}

		
		[self setup];
	}
}

-(void)willPlayNewVideo {
	[playButton1 setSelected:NO];
	[playButton2 setSelected:NO];
}

-(void)setup {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willPlayNewVideo) name:@"playVideo" object:nil];
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	leftTileLabel.text = firstVideo.name;
	leftBottomLabel.text = firstVideo.length;
	rightTitleLabel.text = secondVideo.name;
	rightBottomLabel.text = secondVideo.length;
	
	if ([firstVideo isFavorite]) {
		[fav1 setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	}
	if ([secondVideo isFavorite]) {
		[fav2 setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	}
	if ([[delegate delegate] currentVideo] == firstVideo) {
		[playButton1 setSelected:YES];
	}
	if ([[delegate delegate] currentVideo] == secondVideo) {
		[playButton2 setSelected:YES];
	}
}

-(IBAction)selectFirst {
	if (playButton1.selected) {
		[[delegate delegate] stopPlay];
		[playButton1 setSelected:NO];
	} else {
		[[delegate delegate] playVideo:firstVideo];
		[playButton1 setSelected:YES];
	}
}

-(IBAction)selectSecond {
	if (playButton2.selected) {
		[[delegate delegate] stopPlay];
		[playButton2 setSelected:NO];
	} else {
		[[delegate delegate] playVideo:secondVideo];
		[playButton2 setSelected:YES];
	}}

-(IBAction)favoriteFirst {
	[firstVideo setIsFavorite:![firstVideo isFavorite]];
	if ([firstVideo isFavorite]) {
		[fav1 setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[fav1 setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
}

-(IBAction)favoriteSecond {
	[secondVideo setIsFavorite:![secondVideo isFavorite]];
	if ([secondVideo isFavorite]) {
		[fav2 setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[fav2 setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"playVideo" object:nil];
	[firstVideo release];
	[secondVideo release];
    [super dealloc];
}

@end
