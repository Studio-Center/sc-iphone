    //
//  AudioVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 17.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioFirstVC_Pad.h"
#import "AudioCell.h"
#import "PadNavigator.h"
#import "UIWindow+Shake.h"

@implementation AudioFirstVC_Pad
@synthesize shakeButton1, shakeButton2, mainShakeButton;
@synthesize leftArrow, rightArrow;
@synthesize leftView, rightView, middleView, firstHeader, secondHeader;
@synthesize firstDataSource, secondDataSource;
@synthesize talentVC, root;

#pragma mark -
#pragma mark ArrowClick methods
-(void)viewWillDisappear:(BOOL)animated {
	[[AudioPlayer shared] stopAudio];
}
- (IBAction)didClickRightArrow:(id)sender {
	[root next];
}

- (IBAction)didClickLeftArrow:(id)sender {
	[root prev];
}
- (IBAction)shakeLeft {
	[firstDataSource shake:nil];
}
- (IBAction)shakeRight {
	[secondDataSource shake:nil];
}
#pragma mark -
#pragma mark changeTalentMethods
- (void)changeTalent:(Audio *)audio {
	if (talentVC == nil) {
		talentVC = [[AudioTalentVC_Pad alloc] initWithNibName:@"AudioTalentVC_Pad" bundle:nil];
		[self.middleView addSubview:talentVC.view];
		
		talentVC.view.center = CGPointMake(self.middleView.frame.size.width/2+2, self.middleView.frame.size.height/2+10);

		[mainShakeButton removeFromSuperview];
		mainShakeButton = nil;
	}
	//if ([audio isKindOfClass:[MixOfWeek class]]) {
//		[talentVC setTalent:audio.author];
//	} else {
//		[talentVC setMix:audio];
//	}
	[talentVC setTalent:audio.author];
	
	[[AudioPlayer shared] playAudio:audio delegate:nil];
}


#pragma mark -
#pragma mark UIViewController methods
- (void)setup {
	firstDataSource.tableView = firstTable;
	secondDataSource.tableView = secondTable;
	secondDataSource.delegate = self;
	firstDataSource.delegate = self;
	
	[[PadNavigator sharedNavigator] setCanRotatePortrait:YES];
	[[PadNavigator sharedNavigator] setCanRotateLandscape:NO];
	
	[[NSNotificationCenter defaultCenter] addObserver: self
											 selector: @selector(handleShakeEvent)
												 name: K_SHAKE_EVENT
											   object: nil];
}

- (void)viewDidLoad {
	
	
	[self setup];
	
	UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didClickRightArrow:)];
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];

	firstDataSource.methodName = @"top10Man";
	secondDataSource.methodName = @"top10Woman";
	
	
	[leftArrow setHidden:YES];	
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
		
	[firstDataSource load];
	[secondDataSource load];
}

-(BOOL)canBecomeFirstResponder {
	return YES;
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}

-(void) handleShakeEvent
{
	if (rand()%2) {
		[secondDataSource shake:nil];
	} else {
		[firstDataSource shake:nil];
	}

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver: self];
    [super dealloc];
}


@end
