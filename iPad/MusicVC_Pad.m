    //
//  MusicVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MusicVC_Pad.h"
#import "PadNavigator.h"
#import "MusicDataSource.h"
#import "MixDataSource.h"
#import "AudioDataSource.h"
@implementation MusicVC_Pad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:@"AudioSecondVC_Pad" bundle:nibBundleOrNil];
	if (self != nil) {
		
	}
	return self;
}
- (IBAction)shakeLeft {
	[firstDataSource shake:nil];
}
- (IBAction)shakeRight {
	[secondDataSource shake:nil];
}
#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	[super viewDidLoad];
	[leftButton setHidden:YES];
	[rightButton setHidden:YES];
	[leftArrow setHidden:YES];	
	[rightArrow setHidden:YES];
	
	//[firstDataSource release];
	//[secondDataSource release];
	
	firstDataSource = [MusicDataSource new];
    firstDataSource.methodName = @"getJingles";
    firstDataSource.tableView = firstTable;
	firstDataSource.delegate = self;
	
	secondDataSource = [MusicDataSource new];
    secondDataSource.methodName = @"getOriginal";
    secondDataSource.tableView = secondTable;
	secondDataSource.delegate = self;
    
	firstHeader.text = @"Jingles";
	secondHeader.text = @"Original Music";
}

@end
