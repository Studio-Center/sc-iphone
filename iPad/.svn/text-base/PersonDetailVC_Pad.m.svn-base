//
//  PersonDetailVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 23.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailVC_Pad.h"
#import "PadNavigator.h"
#import "Talent.h"
#import "AsynchronousImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PersonDetailVC_Pad
@synthesize landscapeView, portraitView, portraitDetailView, mainView;
@synthesize personNameLabel, descriptionLabel,skillsLabel, heightLabel, shirtLabel, waistLabel, bustLabel, dressLabel, shoeLabel, favoriteButton;
@synthesize bigPhotoView, smallPhotoView;
@synthesize talent;
@synthesize talentButtonLeft, talentButtonRight;
#pragma mark -
#pragma mark setters
- (void)setParameters:(NSDictionary *)aParameters {
	self.talent = [aParameters objectForKey:@"person"];
	methodName = [[aParameters objectForKey:@"methodName"] retain];
	NSLog(@"methodName =%@",methodName);
	currentPage = [[aParameters objectForKey:@"currentPage"] retain];
	savedContent = [[aParameters objectForKey:@"savedContent"] retain];

}


- (void)updatePerson {
	personNameLabel.text = talent.name;
	portailDesc.text = talent.name;
	bigPhotoView.image = nil;
	smallPhotoView.image = nil;
	NSLog(@"talent.bigImageURL = %@",talent.bigImageURL);
	[bigPhotoView loadImageFromURLString:talent.bigImageURL];
	[smallPhotoView loadImageFromURLString:talent.bigImageURL];
	
	if ([self.talent isFavorite]) {
		[favoriteButton setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[favoriteButton setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
	
	descriptionLabel.text = self.talent.desc;
    descriptionLabel.editable = NO;
}

-(IBAction)clickLeftTalentButton {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if ([methodName isEqualToString:@"getMans"]) {
		[dict setValue:@"getWomans" forKey:@"methodName"];
	} else {
		if ([methodName isEqualToString:@"getWomans"]) {
			[dict setValue:@"getMans" forKey:@"methodName"];
		} else {
			[dict setValue:@"getWomans" forKey:@"methodName"];
		}
	}

	[[PadNavigator sharedNavigator] changeViewController:@"Talent" withParameters:dict];
}
	
-(IBAction)clickRightTalentButton {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if ([methodName isEqualToString:@"getMans"]) {
		[dict setValue:@"getKids" forKey:@"methodName"];
	} else {
		if ([methodName isEqualToString:@"getWomans"]) {
			[dict setValue:@"getKids" forKey:@"methodName"];
		} else {
			[dict setValue:@"getMans" forKey:@"methodName"];
		}
	}
	
	[[PadNavigator sharedNavigator] changeViewController:@"Talent" withParameters:dict];
}
	
-(void)setupButtons {
	
	if ([methodName isEqualToString:@"getMans"]) {
		[talentButtonLeft setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
		[talentButtonRight setImage:[UIImage imageNamed:@"3-r.png"] forState:UIControlStateNormal];
	} else {
		if ([methodName isEqualToString:@"getWomans"]) {
			[talentButtonLeft setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
			[talentButtonRight setImage:[UIImage imageNamed:@"3-r.png"] forState:UIControlStateNormal];
		} else {
			[talentButtonLeft setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
			[talentButtonRight setImage:[UIImage imageNamed:@"1-r.png"] forState:UIControlStateNormal];
		}
	}	
}

#pragma mark -
#pragma mark navigation methods
- (IBAction)infoClick:(id)sender {
	NSDictionary *dict = [NSDictionary dictionaryWithObject:self.talent forKey:@"person"];
	[[PadNavigator sharedNavigator] changeViewController:@"PortraitDetail" withParameters:dict];
}


- (IBAction)closeClick:(id)sender {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[dict setObject:animation forKey:@"animation"];
	[dict setObject:methodName forKey:@"methodName"];
	[dict setObject:currentPage forKey:@"currentPage"];
	[dict setObject:savedContent forKey:@"savedContent"];
	[[PadNavigator sharedNavigator] changeViewController:@"ChoosePerson" withParameters:dict];
}


- (IBAction)favorite:(id)sender {
	[sender setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	[self.talent setIsFavorite:YES];
}

#pragma mark -
#pragma mark UIViewController methods
- (void)viewDidLoad {
	self.view.frame = [[[PadNavigator sharedNavigator] contentView] frame];
	if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
		[self.view addSubview:portraitView];
	}
	
	if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
		[self.view addSubview:landscapeView];
	}
	
}
	
-(void)viewWillAppear:(BOOL)animated {
	[self performSelector:@selector(updatePerson) withObject:nil afterDelay:0.1];
	[self setupButtons];
}
	
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	self.view.frame = [[[PadNavigator sharedNavigator] contentView] frame];
	[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:toInterfaceOrientation duration:0];
	
	if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        [self remooveAllSubviews];
		[self.view addSubview:landscapeView];
		return;
	}
	
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		[self remooveAllSubviews];
		[self.view addSubview:portraitView];
		return;
	}
}


- (void)remooveAllSubviews {
    for (UIView *subview in self.view.subviews) {
        [subview removeFromSuperview];
    }
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
