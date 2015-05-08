//
//  AudioRootVC_Pad.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/17/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseiPadController.h"

@class AudioFirstVC_Pad;
@class AudioMiddleVC_Pad;
@class AudioSecondVC_Pad;

@interface AudioRootVC_Pad : BaseiPadController  {
	AudioFirstVC_Pad *first;
	AudioMiddleVC_Pad  *second;
	AudioSecondVC_Pad *last;
	
	UIViewController *current;
}
-(void)next;
-(void)prev;
- (void)slideToController:(UIViewController*)controller type:(int)type;
@end
