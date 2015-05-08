    //
//  AudioTalentVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 11.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioTalentVC_Pad.h"


@implementation AudioTalentVC_Pad
@synthesize talent;
@synthesize photo, nameLabel, addToFavorite;

#pragma mark -
#pragma mark setters
- (void)setTalent:(Talent *)aTalent {
	talent = [aTalent retain];
	if ([talent isFavorite]) {
		[addToFavorite setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[addToFavorite setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
	self.photo.image = nil;
	[self.photo loadImageFromURLString:[talent url]];
	self.nameLabel.text = [aTalent name];
}


#pragma mark -
#pragma mark Adding to favorite methods
- (IBAction)favoriteClick:(id)sender {
	[addToFavorite setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	[talent setIsFavorite:YES];
}


#pragma mark -
#pragma mark UIViewController methods
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)dealloc {
	[talent release];
    [super dealloc];
}


@end
