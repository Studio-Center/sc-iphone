//
//  SplashVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 26.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashVC_Phone.h"

#import "AppDelegate_Phone.h"
#import "PhoneNavigator.h"

@implementation SplashVC_Phone

- (IBAction)buttonClick:(id)sender {
	UIButton *clickedButton = sender;
	NSString *viewName = [NSString stringWithString:[[clickedButton titleLabel] text]];
	if (navigator==nil) {
		navigator = [[PhoneNavigator alloc] initWithNibName:@"PhoneNavigator" bundle:nil];
	}
	navigator.view.center = CGPointMake(navigator.view.center.x, 245);
	//UIWindow *window = [(AppDelegate_Phone*)[[UIApplication sharedApplication] delegate] window];
	[UIView beginAnimations:@"ShowView" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView	setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
	[self.view addSubview:navigator.view];
	
	[navigator load:viewName];
	//[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPhonebkgd.png"]]];
	[UIView commitAnimations];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return NO;
}
-(void)dealloc {
	[navigator release];
	[super dealloc];
}


@end
