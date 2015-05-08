    //
//  AppNavigationController.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/2/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AppNavigationController.h"


@implementation AppNavigationController
@synthesize viewControllers, prev, next;

-(id)init {
	if (self = [super init]) {
		viewControllers = [NSMutableArray new];
		currentViewControllerIndex = -1;
	}
	return self;
}

-(void)addViewController:(UIViewController*)viewController {
	[self.viewControllers addObject:viewController];
}



- (void)dealloc {
	self.viewControllers = nil;
    [super dealloc];
}

@end
