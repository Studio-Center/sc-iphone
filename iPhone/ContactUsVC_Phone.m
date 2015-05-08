//
//  ContactUsVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactUsVC_Phone.h"

#import "LocationsVC_Phone.h"
#import "AuditionVC_Phone.h"
#import <MessageUI/MessageUI.h>
#import "PhoneNavigator.h"
#import "LocationsDataSource.h"
#import "Location.h"
#import "LocationMap.h"

@implementation ContactUsVC_Phone
@synthesize startView, mainView;
@synthesize currentTag;
@synthesize auditionButton, locationsButton, estimationButton;
@synthesize addressText, phoneText;

- (void)setCurrentTag:(NSInteger)aTag {
	currentTag = aTag;
	if (currentTag == 3) {
		currentTag = 0;
	}
	if (currentTag == -1) {
		currentTag = 2;
	}
	
	switch (currentTag) {
		case 1:
			[self showLocations:locationsButton];
			break;
		case 0:
			[self showAuditions:auditionButton];
			break;
		case 2:
			[self showEstimation:estimationButton];
			break;

		default:
			break;
	}
	
}

- (void)leftArrowClick {
	self.currentTag = currentTag-1;
}

- (void)rightArrowClick {
	self.currentTag = currentTag+1;
}

- (void)clearButtons {
	[auditionButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	[locationsButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	[estimationButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
}


- (IBAction)addressClick {
	Location *location = [[[LocationsDataSource shared] locations] objectAtIndex:5];
	LocationMap *map = [[LocationMap alloc] initWithLocation:location];
	[self.navigationController pushViewController:map animated:YES];
	[map release];
}

- (IBAction)showLocations:(id)sender {
	[self clearButtons];
	[sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self clearMainView];

	[currentViewController release];
	LocationsVC_Phone *locationsVC_Phone = [[LocationsVC_Phone alloc] initWithNibName:@"LocationsVC_Phone" bundle:nil];
	locationController = [[UINavigationController alloc] initWithRootViewController:locationsVC_Phone];
	locationController.view.frame  = CGRectMake(0, 0, 320, 385);
	[locationController setNavigationBarHidden:YES];
	[locationsVC_Phone release];
	[self addViewAnimated:locationController.view];
	//currentViewController = locationController;
}

- (IBAction)showAuditions:(id)sender {
	[self clearButtons];
	[sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self clearMainView];
	[currentViewController release];
	AuditionVC_Phone *auditionViewController = [[AuditionVC_Phone alloc] initWithNibName:@"AuditionVC_Phone" bundle:nil];
	auditionViewController.mainController = self;
	[mainView addSubview:[auditionViewController view]];
	[self addViewAnimated:auditionViewController.view];
	currentViewController = auditionViewController;
}

-(IBAction)mailIt {
	
}

- (IBAction)showEstimation:(id)sender {
	[self clearButtons];
	[sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setCcRecipients:[NSArray arrayWithObject:@"william@studiocenter.com"]];
	[picker setSubject:@"Estimate Request"];
	
	
	NSString *emailBody = @"";
	[picker setMessageBody:emailBody isHTML:YES];
	
	[[PhoneNavigator shared] presentModalViewController:picker animated:YES];
	[picker release];
}


-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	if (result == MFMailComposeResultSent) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"E-mail was sent" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert autorelease];
	}
	[[PhoneNavigator shared] dismissModalViewControllerAnimated:YES];
}

- (void)addViewAnimated:(UIView *)aView {
	[UIView beginAnimations:@"ShowView" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView	setAnimationTransition:UIViewAnimationTransitionCurlUp forView:[self mainView] cache:YES];
	[[self mainView] addSubview:aView];
	[UIView commitAnimations];
}

- (IBAction)showVoice:(id)sender {
	
}

- (IBAction)showOnCamera:(id)sender {
	
}

- (void)showMap {
	
}

- (void)clearMainView {
	for (UIView *subview in [mainView subviews]) {
		[subview removeFromSuperview];
	}
}

- (IBAction)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/studiocenter"]];
}

- (IBAction)openYouTube {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/user/StudioCenterTotalPro"]];
}

- (IBAction)openFacebook {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/StudioCenter"]];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {	
	[mainView addSubview:startView];
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[startView addSubview:bgImage];
	[startView sendSubviewToBack:bgImage];
	
	// contact text formatting
	addressText.font = [UIFont boldSystemFontOfSize:11];
	phoneText.font = [UIFont boldSystemFontOfSize:11];
}

-(void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:YES];
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
