    //
//  TalentVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TalentVC_Pad.h"
#import "PadNavigator.h"
#import "ChoosePersonVC_Pad.h"
#import "PadNavigator.h"

#import "Talent.h"
#import <QuartzCore/QuartzCore.h>

@implementation TalentVC_Pad

- (IBAction)goToChoosePerson:(id)sender {
	
	NSArray *methods = [NSArray	arrayWithObjects:@"getMans",@"getWomans",@"getKids",nil];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[methods objectAtIndex:[sender tag]] forKey:@"methodName"];
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[dict setObject:animation forKey:@"animation"];
	[[PadNavigator sharedNavigator] changeViewController:@"ChoosePerson" withParameters:dict];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


@end
