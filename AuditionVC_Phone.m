//
//  AuditionVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AuditionVC_Phone.h"


@implementation AuditionVC_Phone
@synthesize mainController;
@synthesize sendingDataForm;


-(IBAction)voice:(id)sender {
	[self.mainController clearMainView];
	if (voiceVc==nil) {
		voiceVc = [[VoiceVC_Phone alloc] initWithNibName:@"VoiceVC_Phone" bundle:nil];
	}
	[[self.mainController mainView] addSubview:[voiceVc view]];
}

-(IBAction)camera:(id)sender {
	[self.mainController clearMainView];
	if (oncameraVc==nil) {
		oncameraVc = [[OnCameraVC_Phone alloc] initWithNibName:@"OnCameraVC_Phone" bundle:nil];
	}
	[[self.mainController mainView] addSubview:[oncameraVc view]];
}

-(void)viewDidLoad{
	
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];
	
}

@end
