//
//  ShakeViewController.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ShakeViewController.h"


@implementation ShakeViewController
@synthesize nameLabel;
@synthesize content;
@synthesize talent;
@synthesize delegate;

- (void)setContent:(Audio *)aAudio {
	content = [aAudio retain];
}

- (void)setTalent:(Talent *)aTalent {
	talent = [aTalent retain];
	self.nameLabel.text = talent.name;
}

- (void)shakeClick:(id)sender {
	[[AudioPlayer shared] stopAudio];
	[delegate shake:sender];
	[self didStopPlaying];
}

- (void)closeClick:(id)sender {
	[UIView beginAnimations:@"hide" context:nil];
    self.view.center = CGPointMake(160, -100);
	button.selected = NO;
    [UIView commitAnimations];
}

- (void)playClick:(UIButton*)sender {
	
	button = sender;
	sender.selected = !sender.selected;
	
	if (!sender.selected) {
		[[AudioPlayer shared] stopAudio];
	} else {
		[[AudioPlayer shared] playAudio:content delegate:self];
	}
}

-(void)didStopPlaying {
	button.selected = NO;
}

@end
