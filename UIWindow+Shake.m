//
//  UIWindow+Shake.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/23/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "UIWindow+Shake.h"


@implementation UIWindow (Shake)
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion = UIEventSubtypeMotionShake) {
		NSLog(@"Shake");
		[[NSNotificationCenter defaultCenter] postNotificationName:	K_SHAKE_EVENT object: nil];
		[super motionBegan:motion withEvent:event];
	}
}
@end
