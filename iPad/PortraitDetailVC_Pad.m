    //
//  PortraitDetailVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 06.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PortraitDetailVC_Pad.h"
#import "PadNavigator.h"
#import "Talent.h"

@implementation PortraitDetailVC_Pad
@synthesize descriptionLabel, favoriteButton, personNameLabel;
@synthesize talent;
#pragma mark -
#pragma mark setters
- (void)setParameters:(NSDictionary *)aParameters {
	parameters = [aParameters retain];
	self.talent = [parameters objectForKey:@"person"];
}

- (IBAction)closeClick:(id)sender {
	[[PadNavigator sharedNavigator] changeViewController:@"ChoosePerson"];
}


-(IBAction)favorite:(id)sender {
	[sender setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	[self.talent setIsFavorite:YES];
}

- (void)updateInfo {
	if ([self.talent isFavorite]) {
		[favoriteButton setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[favoriteButton setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
	self.personNameLabel.text = self.talent.name;
	self.descriptionLabel.text = self.talent.desc;
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	
	[self updateInfo];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
