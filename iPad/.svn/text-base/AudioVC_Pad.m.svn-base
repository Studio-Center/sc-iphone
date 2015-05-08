    //
//  AudioViewController.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/2/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AudioVC_Pad.h"


@implementation AudioVC_Pad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		first = [[AudioVCFirst_Pad alloc] initWithNibName:@"AudioVCFirst_Pad" bundle:nil];
		second = [[AudioVCSecond_Pad alloc] initWithNibName:@"AudioVCSecond_Pad" bundle:nil];
		self.view = first.view;
    }	
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return NO;
}

- (void)dealloc {
	[first release];
	[second release];
    [super dealloc];
}


@end
