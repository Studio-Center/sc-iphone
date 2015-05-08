//
//  PhotoVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhotoVC_Phone.h"
#import "PersonDetailVC_Phone.h"

@implementation PhotoVC_Phone
@synthesize photo, labelName, delegate;
@synthesize talent, talentPhoto, page;


- (void)setTalent:(Talent *)aTalent {
	talent = [aTalent retain];
}

-(IBAction)showInfo:(id)sender {
	PersonDetailVC_Phone *details = [[PersonDetailVC_Phone alloc] initWithNibName:@"PersonDetailVC_Phone" bundle:nil];
	details.talent = talent;
	[delegate showViewController:details];
	[details release];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	labelName.text = talent.name;
	[photo loadImageFromURLString:talent.bigImageURL];
		
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
