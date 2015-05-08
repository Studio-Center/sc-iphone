//
//  AudioVCSecond_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 25.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioSecondVC_Pad.h"
#import "PadNavigator.h"
#import "ForeignAudioDataSource.h"

@implementation AudioSecondVC_Pad
@synthesize leftButton, rightButton;
- (IBAction)didClickLeftArrow:(id)sender {
	[root prev];
}

- (void)changeTalent:(Talent *)aTalent {
	[super changeTalent:aTalent];
	talentVC.view.center = CGPointMake(self.middleView.frame.size.width/2, self.middleView.frame.size.height/2+30);
	[talentVC.photo setFrame:CGRectMake(20, 50, 192, 190)];
}

- (IBAction)shakeLeft {
	[firstDataSource shake:nil];
}

- (IBAction)shakeRight {
	[secondDataSource shake:nil];
}

- (void)viewDidLoad {
	[self setup];
	[leftButton setHidden:YES];
	[rightArrow setHidden:YES];
	
	[firstDataSource release];
	
	firstDataSource = [ForeignAudioDataSource new];
	firstDataSource.tableView = firstTable;
	firstDataSource.delegate = self;
	[firstDataSource load];
	
	firstDataSource.methodName = @"getForeignAudio";
	
	secondDataSource.methodName = @"getMixOFWeek";
}

@end
