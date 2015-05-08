    //
//  StartVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate_Pad.h"

#import "StartVC_Pad.h"
//#import "AudioVC_Pad.h"

#import "PadNavigator.h"

@implementation StartVC_Pad

- (IBAction)buttonClick:(id)sender {
	[PadNavigator show];
	
	[[PadNavigator sharedNavigator] buttonClick:sender];
	
	[self.view removeFromSuperview];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)dealloc {
    [super dealloc];
}


@end
