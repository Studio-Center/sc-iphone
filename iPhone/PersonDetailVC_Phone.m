//
//  PersonDetailVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailVC_Phone.h"
#import "Talent.h"

@implementation PersonDetailVC_Phone
@synthesize labelName, descriptionTextView;
@synthesize talent;


- (void)setTalent:(Talent *)aTalent {
	talent = [aTalent retain];
}

-(void)viewWillAppear:(BOOL)animated {
	self.labelName.text = talent.name;
	self.descriptionTextView.text = talent.desc;
    self.descriptionTextView.editable = NO;
}

- (IBAction)favorite:(id)sender {
	[sender setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	[talent setIsFavorite:YES];
}

- (void)viewDidLoad {

	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];
	
}

- (void)dealloc {
	[talent release];
    [super dealloc];
}

@end
