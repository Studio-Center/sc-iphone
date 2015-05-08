//
//  UIViewController+rotations.m
//  SCProduction
//
//  Created by Владимир Шевченко on 06.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+rotations.h"


@implementation UIViewController (rotations)

- (void)rotateToInterfaceOrientation:(UIInterfaceOrientation)anOrientation {
	
	NSLog(@"Rect:%@", NSStringFromCGRect(self.view.frame));
	
	if (anOrientation == UIInterfaceOrientationLandscapeRight) {
		NSLog(@"Rotate to LandscapeRight");
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 1024.0, 748.0);
		self.view.center = CGPointMake(374.0, 512.0);
	}
	
	if (anOrientation == UIInterfaceOrientationLandscapeLeft) {
		NSLog(@"Rotate to LandscapeLeft");
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(-90.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 1024.0, 748.0);
		self.view.center = CGPointMake(394.0, 512.0);
	}
	
	if (anOrientation == UIInterfaceOrientationPortrait) {
		NSLog(@"Rotate to Portrait");
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(0.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 768.0, 1004.0);
		self.view.center = CGPointMake(384.0, 512.0);
	}
	
	if (anOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		NSLog(@"Rotate to PortraitDown");
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(180.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 768.0, 1004.0);
		self.view.center = CGPointMake(384.0, 512.0);
	}
	
	[[UIApplication sharedApplication] setStatusBarOrientation:anOrientation];
}


@end
