    //
//  BasicNavigator.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PadNavigator.h"

#import "AudioVC_Pad.h"
#import "MusicVC_Pad.h"
#import "TalentVC_Pad.h"
#import "VideoVC_Pad.h"
#import "ContactUsVC_Pad.h"
#import "FavoritesVC_Pad.h"
#import "SearchVC_Pad.h"

#import "ChoosePersonVC_Pad.h"
#import "PersonDetailVC_Pad.h"

#import "AppDelegate_Pad.h"
#import "TalentBaseViewController.h"
#import "AudioRootVC_Pad.h"
#import <QuartzCore/QuartzCore.h>

static PadNavigator *_sharedNavigator = nil;

@implementation PadNavigator
@synthesize contentView, currentViewController, viewControllers;
@synthesize canRotateLandscape, canRotatePortrait;

+ (id)sharedNavigator {
		if (_sharedNavigator == nil) {
		_sharedNavigator = [[PadNavigator alloc] initWithNibName:@"PadNavigator" bundle:nil];
	}
	return _sharedNavigator;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		viewControllers = [NSMutableDictionary new];
	}
	return self;
}

+ (void)show {
	[self sharedNavigator];
	[_sharedNavigator.view setCenter:CGPointMake(384, 522)];
	
	UIWindow *mainWindow = [(AppDelegate_Pad*)[UIApplication sharedApplication].delegate window]; 
	
	[UIView beginAnimations:@"ShowView" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView	setAnimationTransition:UIViewAnimationTransitionCurlUp forView:mainWindow cache:YES];
	[mainWindow addSubview:_sharedNavigator.view];
	[UIView commitAnimations];
}

- (void)updateViewController:(UIViewController*)newViewController  {
	if (newViewController) {
		
		[[AudioPlayer shared] stopAudio];
		
		[self.currentViewController viewWillDisappear:YES];
		[self.currentViewController.view removeFromSuperview];
		self.currentViewController = newViewController;
		
		[self.view addSubview:self.currentViewController.view];
        
        [currentViewController viewWillAppear:YES];
		if ([currentViewController shouldAutorotateToInterfaceOrientation:self.interfaceOrientation]) {
			[currentViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
		} else {
			if (!UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
				[self rotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft duration:0];
			} else {
				[self rotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
			}
		}
	}
}

- (id)viewControllerByName: (NSString *) controllerName  {
	NSString *className = [NSString stringWithFormat:@"%@VC_Pad",controllerName];
	id newViewController= [viewControllers objectForKey:className];
	[newViewController retain];
	if (newViewController == nil) {
		Class ControllerClass = NSClassFromString(className);
		if (ControllerClass) {
			if ([ControllerClass isEqual:[AudioRootVC_Pad class]]) {
				newViewController = [ControllerClass new];
			} else {
				newViewController = [[ControllerClass alloc] initWithNibName:className bundle:nil];
			}
		
			[viewControllers setObject:newViewController forKey:className];
		}
	}
	
	return newViewController;
}

- (IBAction)buttonClick:(id)sender {
    prevButton.selected = NO;
	UIButton *clickedButton = (UIButton*)sender;
    clickedButton.selected = YES;
    
    prevButton = clickedButton;
    
	NSString *buttonTittle = clickedButton.titleLabel.text;
	
	id newViewController = [self viewControllerByName:buttonTittle];
	[self updateViewController:newViewController];
	[newViewController release];
}

- (void)changeViewController:(NSString*)controllerName {
	[self changeViewController:controllerName withParameters:nil];
}

- (void)changeViewController:(NSString*)controllerName withParameters:(NSDictionary *)aParameters {
	id newViewController = [self viewControllerByName:controllerName];
	
	if ([newViewController respondsToSelector:@selector(setParameters:)]&&aParameters) {
		[newViewController setParameters:aParameters];
	}
	if ([aParameters valueForKey:@"animation"]) {
		CAAnimation *animation = [aParameters valueForKey:@"animation"];
		
		[[self.view layer] addAnimation:animation forKey:@"show"];
	}
	[self updateViewController:newViewController];
	[newViewController release];
}

#pragma mark -
#pragma mark rotation methods
- (void)rotateViewController:(UIViewController*)vc toOrientatio:(UIInterfaceOrientation)anOrientation {
	NSLog(@"RotateA");
	[UIView beginAnimations:@"sad" context:nil];
	[[UIApplication sharedApplication] setStatusBarOrientation:anOrientation];
	
	if (anOrientation == UIInterfaceOrientationLandscapeRight) {
		NSLog(@"Rotate %@ to LandscapeRight",vc);
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 1024.0, 748.0);
		self.view.center = CGPointMake(374.0, 512.0);
		vc.view.frame = CGRectMake(0.0, 0.0, 1024.0, 620);
	}
	
	if (anOrientation == UIInterfaceOrientationLandscapeLeft) {
		NSLog(@"Rotate %@ to LandscapeLeft",vc);
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(-90.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 1024.0, 748.0);
		self.view.center = CGPointMake(394.0, 512.0);
		vc.view.frame = CGRectMake(0.0, 0.0, 1024.0, 620);
	}
	
	if (anOrientation == UIInterfaceOrientationPortrait) {
		NSLog(@"Rotate %@ to Portrait",vc);
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(0.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 768.0, 1004.0);
		self.view.center = CGPointMake(384.0, 512.0);
		vc.view.frame = CGRectMake(0.0, 0.0, 768, 885);
	}
	
	if (anOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		NSLog(@"Rotate %@ to PortraitDown",vc);
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(180.0));
		self.view.bounds = CGRectMake(0.0, 0.0, 768.0, 1004.0);
		self.view.center = CGPointMake(384.0, 512.0);
		vc.view.frame = CGRectMake(0.0, 0.0, 768, 885);
	}
	[UIView commitAnimations];
}

- (void)rotateToInterfaceOrientation:(UIInterfaceOrientation)anOrientation duration:(NSTimeInterval)duration {
	NSLog(@"RotateB");
	[UIView beginAnimations:@"sad" context:nil];
    [[UIApplication sharedApplication] setStatusBarOrientation:anOrientation];
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
	[UIView commitAnimations];
}

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

#pragma mark -
#pragma mark UIViewController methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	BOOL should = [currentViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
	NSLog(@"Rotate - %@ to %@",should?@"YES":@"NO",currentViewController);
 	return should;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    for(id vc in [viewControllers allValues])
    {
        [vc willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    }
}

- (void)dealloc {
	self.viewControllers = nil;
	self.currentViewController = nil;
	[commonSubviews release];
	[contentView release];
    [super dealloc];
}


@end
