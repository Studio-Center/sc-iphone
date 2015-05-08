    //
//  AudioMiddleVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 07.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioMiddleVC_Pad.h"
#import "PadNavigator.h"

@implementation AudioMiddleVC_Pad

#pragma mark -
#pragma mark ArrowClick methods

- (IBAction)didClickLeftArrow:(id)sender {
	[root prev];
}

- (IBAction)didClickRightArrow:(id)sender {
	[root next];
}

#pragma mark -
#pragma mark UIViewController methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:@"AudioFirstVC_Pad" bundle:nibBundleOrNil];
	if (self != nil) {
		
	}
	return self;
}

- (void)viewDidLoad {
	[self setup];
	
	firstDataSource.methodName = @"getBoysAudio";
	secondDataSource.methodName = @"getGirlsAudio";
	
	[leftArrow setHidden:NO];	
	
	firstHeader.text = @"Boys";
	secondHeader.text = @"Girls";
}

@end
