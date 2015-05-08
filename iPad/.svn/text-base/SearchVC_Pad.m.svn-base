    //
//  SearchVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SearchVC_Pad.h"
#import "PadNavigator.h"


@implementation SearchVC_Pad
@synthesize searchTextField;

- (IBAction)cancrlButtonClick:(id)sender {

	[searchTextField resignFirstResponder];
}

-(void)textFieldShouldReturn:(UITextField *)textField {
	searchDataSource.searchToken = [textField text];
}

- (void)viewDidLoad {
	searchDataSource = [SearchDataSource new];
	searchDataSource.tableView = searchTable;
	
	[[PadNavigator sharedNavigator] setCanRotatePortrait:YES];
	[[PadNavigator sharedNavigator] setCanRotateLandscape:NO];
}

- (void)viewWillAppear:(BOOL)animated {
	if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
	} else {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
	[searchDataSource release];
    [super dealloc];
}


@end
