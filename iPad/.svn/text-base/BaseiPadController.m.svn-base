    //
//  BaseiPadController.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseiPadController.h"
#import "PadNavigator.h"

@implementation BaseiPadController

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	if ([self shouldAutorotateToInterfaceOrientation:toInterfaceOrientation]) {
		[[PadNavigator sharedNavigator] rotateViewController:self toOrientatio:toInterfaceOrientation];
	} else  {
        if([self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait]) {
            [[PadNavigator sharedNavigator] rotateViewController:self toOrientatio:UIInterfaceOrientationPortrait];
        } else {
            [[PadNavigator sharedNavigator] rotateViewController:self toOrientatio:UIInterfaceOrientationLandscapeLeft];
        }
    }
}
@end
