//
//  BaseViewController.m
//  SCProduction
//
//  Created by Владимир Шевченко on 15.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BaseViewController.h"


@implementation BaseViewController
@synthesize button1, button2, button3, button4, button5, button6, currentButtonTag;

- (void)leftArrowClick{
	[[AudioPlayer shared] stopAudio];
	[self setCurrentButtonTag:(currentButtonTag-1)];
}

- (void)rightArrowClick {
	[[AudioPlayer shared] stopAudio];
	[self setCurrentButtonTag:(currentButtonTag+1)];
}

- (void)setCurrentButtonTag:(NSInteger)aTag {
	
}

@end
