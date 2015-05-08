    //
//  AudioRootVC_Pad.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/17/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AudioRootVC_Pad.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import "AudioFirstVC_Pad.h"
#import "AudioMiddleVC_Pad.h"
#import "AudioSecondVC_Pad.h"

@implementation AudioRootVC_Pad
-(id)init {
	if (self = [super init]) {
		
	}
	return self;
}

-(void)viewDidLoad {
	first = [[AudioFirstVC_Pad alloc] initWithNibName:@"AudioFirstVC_Pad" bundle:nil];
	first.root = self;
	
	UISwipeGestureRecognizer *firstrect = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	[first.view addGestureRecognizer:firstrect];
	[firstrect  release];
	
	second = [[AudioMiddleVC_Pad alloc] initWithNibName:@"AudioFirstVC_Pad" bundle:nil];
	second.root = self;
	
	UISwipeGestureRecognizer *secondrect = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	[secondrect setDirection:UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight];
	[second.view addGestureRecognizer:secondrect];
	[secondrect  release];
	
	last = [[AudioSecondVC_Pad alloc] initWithNibName:@"AudioSecondVC_Pad" bundle:nil];
	last.root = self;
	
	UISwipeGestureRecognizer *lastrect = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	[lastrect setDirection:UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight];
	[last.view addGestureRecognizer:lastrect];
	[lastrect  release];
	
	current = first;
	
	[self.view addSubview:current.view];
	[current viewWillAppear:YES];
	
	self.view.frame = CGRectMake(0.0, 0.0, 768, 885);	
}

-(void)swipe:(UISwipeGestureRecognizer*)sender {

	UISwipeGestureRecognizerDirection dir = sender.direction;
	
	if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
		[self next];
	} else {
		if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
			[self prev];
		}
	}
}

- (id)nextViewController {
	if (current == first) {
		return second;
	} else {
		if (current == second) {
			return last;
		} else {
			return nil;
		}
	}
}

- (id)prevViewController {
	if (current == last) {
		return second;
	} else {
		if (current == second) {
			return first;
		} else {
			return nil;
		}	
	}
}
- (void)slideToController:(UIViewController*)controller type:(int)type {
	if (controller == nil) {
		return;
	}
	[controller.view setUserInteractionEnabled:NO];
	UIViewController *from = current;
	UIViewController *to = controller;
	current = to;
	
	[from viewWillDisappear:YES];
	[to viewWillAppear:YES];
	
	[from.view removeFromSuperview];
	
	[self.view addSubview:to.view];
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:type];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	animation.delegate = self;
	
	[[self.view layer] addAnimation:animation forKey:@"SwitchToView1"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	[current.view setUserInteractionEnabled:YES];
}
-(void)next {
	[self slideToController:[self nextViewController] type:kCATransitionFromRight];
}

-(void)prev {
	[self slideToController:[self prevViewController] type:kCATransitionFromLeft];
}
-(void)dealloc {
	[first release];
	[second release];
	[last release];
	[super dealloc];
}
@end
