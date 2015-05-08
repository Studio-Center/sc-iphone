//
//  TalentVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TalentVC_Phone.h"

#import "ChoosePersonVC_Phone.h"
#import "PhoneNavigator.h"

@implementation TalentVC_Phone
@synthesize startView, mainView, manButton, back, viewController, womanButton, kidsButton;

- (IBAction)buttonClick:(UIButton*)sender {
	
	[[[PhoneNavigator shared] mainLabel] setText:[sender titleForState:UIControlStateNormal]];
	if ([sender buttonType]!=UIButtonTypeCustom) {
		[sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	if ([prevButton buttonType]!=UIButtonTypeCustom) {
		[prevButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	}
	
	prevButton = sender;
	
	[self showRoot];
}

- (void)leftArrowClick {
	if ([viewController isKindOfClass:[ChoosePersonVC_Phone class]]) {
		[viewController setCurrentPage:[viewController currentPage]-1];
	}
}

- (void)rightArrowClick {
	if ([viewController isKindOfClass:[ChoosePersonVC_Phone class]]) {
		[viewController setCurrentPage:[viewController currentPage]+1];
	}
}


-(void)showRoot {
	viewController = [[ChoosePersonVC_Phone alloc] initWithNibName:@"ChoosePersonVC_Phone" bundle:nil];
	int tag = [prevButton tag];
	[viewController setMethodName:[methods objectAtIndex:tag]];
	[viewController setDelegate:self];
	[viewController viewWillAppear:YES];
	[startView removeFromSuperview];
	[self showViewController:viewController];
	[back setHidden:NO];
	[viewController release];
}


-(void)showViewController:(UIViewController*)vc {
	[[viewController view] removeFromSuperview];
	[viewController release];
	viewController = [vc retain];
	
	[UIView beginAnimations:@"ShowView" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView	setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mainView cache:YES];
	[mainView addSubview:[viewController view]];
	[UIView commitAnimations];	
	[vc viewWillAppear:YES];
}


- (IBAction)goBack:(id)sender {
	[[viewController view] removeFromSuperview];
	if ([viewController isMemberOfClass:[ChoosePersonVC_Phone class]]) {
		for (UIView *view in [mainView subviews]) {
			[view removeFromSuperview];
		}
		[back setHidden:YES];
		[UIView beginAnimations:@"ShowView" context:nil];
		[UIView	setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mainView cache:YES];
		[mainView addSubview:startView];
		[UIView commitAnimations];	
		[[[PhoneNavigator shared] mainLabel] setText:@"Talents"];
		[manButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
		[womanButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
		[kidsButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
		[[PhoneNavigator shared] makeArrowsHidden:YES];
	} else {
		[self showRoot];
	}
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	[mainView addSubview:startView];
	methods = [[NSArray alloc] initWithObjects:@"getMans",@"getWomans",@"getKids",nil];

}

- (void)viewWillAppear:(BOOL)animated {
	[[PhoneNavigator shared] makeArrowsHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
