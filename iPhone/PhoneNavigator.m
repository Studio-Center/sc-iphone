//
//  PhoneNavigator.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhoneNavigator.h"
#import "AppDelegate_Phone.h"
#import "SplashVC_Phone.h"

#import "AudioVC_Phone.h"
#import "VideoVC_Phone.h"
#import "MusicVC_Phone.h"
#import "TalentVC_Phone.h"
#import "SearchVC_Phone.h"
#import "ContactUsVC_Phone.h"
#import "FavoritesVC_Phone.h"
#define NS_BLOCKS_AVAILABLE
@implementation PhoneNavigator
static PhoneNavigator *sharedPhoneNavigator = nil;
@synthesize mainView, mainLabel;
@synthesize leftArrow, rightArrow, favoritesButton, searchButton, viewController;

+ (PhoneNavigator*)shared {
	return sharedPhoneNavigator;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, 0.0, 320.0, 480.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];

	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
	}
	sharedPhoneNavigator = self;
	return self;
}
- (void)makeArrowsHidden:(BOOL)flag {
	[leftArrow setHidden:flag];
	[rightArrow setHidden:flag];
}

- (void)leftArrowClick:(id)sender {
	[self.viewController leftArrowClick];
}

- (void)rightArrowClick:(id)sender {
	[self.viewController rightArrowClick];
}


- (IBAction)search:(id)search {
	[self load:@"SearchVC_Phone"];
}

- (IBAction)gotoFavorites:(id)search; {
	[self load:@"FavoritesVC_Phone"];
}

- (void)load:(NSString*)viewName {
	[self.viewController.view removeFromSuperview];
	self.viewController = nil;
	
	[[AudioPlayer shared] stopAudio];
	
	Class ViewController = NSClassFromString(viewName);
	self.viewController = [[ViewController alloc] initWithNibName:viewName bundle:nil];
			
	if (self.viewController) {
		[leftArrow addTarget:self action:@selector(leftArrowClick:) forControlEvents:UIControlEventTouchDown];
		[rightArrow addTarget:self action:@selector(rightArrowClick:) forControlEvents:UIControlEventTouchDown];
		[self.viewController viewWillAppear:YES];
		[UIView beginAnimations:@"ShowView" context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView	setAnimationTransition:UIViewAnimationTransitionCurlUp forView:[self mainView] cache:YES];
		[[self mainView] addSubview:self.viewController.view];
		[UIView commitAnimations];
	}
	[self performSelector:@selector(setHeaderTitle:) withObject:viewName afterDelay:0.0];
}


-(void)setHeaderTitle:(NSString*)htitle {
	NSMutableString *str = [NSMutableString stringWithString:htitle];
	NSRange range;
	range.location = [str length] - 8;
	range.length = 8;
	[str deleteCharactersInRange:range];
	[mainLabel setText:str];
}


- (IBAction)goHome:(id)sender {
	[[AudioPlayer shared] stopAudio];
	UIWindow *window = [(AppDelegate_Phone*)[[UIApplication sharedApplication] delegate] window];
	[UIView beginAnimations:@"ShowView" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView	setAnimationTransition:UIViewAnimationTransitionCurlDown forView:window cache:YES];
	[[self view] removeFromSuperview];
	[UIView commitAnimations];	
	
	//[favoritesButton setCenter:CGPointMake(searchButton.center.x-32, searchButton.center.y-2)];
	[searchButton setHidden:NO];
}


-(void)dealloc {
	self.viewController = nil;
	[super dealloc];
}
@end
