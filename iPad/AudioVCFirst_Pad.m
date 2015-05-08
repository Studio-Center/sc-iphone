    //
//  AudioVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 17.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioVCFirst_Pad.h"
#import "AudioCell.h"
#import "PadNavigator.h"

@implementation AudioVCFirst_Pad

@synthesize leftArrow, rightArrow;
@synthesize leftView, rightView, middleView;
@synthesize manDataSource, womanDataSource;

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	[[PadNavigator sharedNavigator] setCanRotatePortrait:YES];
	[[PadNavigator sharedNavigator] setCanRotateLandscape:NO];
	
	if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
	} else {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
	}

	[leftArrow setHidden:YES];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}


- (void)dealloc {
    [super dealloc];
}


@end
