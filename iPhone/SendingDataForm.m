//
//  SendingDataForm.m
//  SCProduction
//
//  Created by Владимир Шевченко on 16.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SendingDataForm.h"


@implementation SendingDataForm
@synthesize scrollView;
@synthesize info;

#pragma mark -
#pragma mark UITextField delegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma mark -
#pragma mark UIViewController methods
- (void)viewWillAppear:(BOOL)animated {
	[scrollView setScrollEnabled:YES];
	[scrollView setContentSize:CGSizeMake(320, 580)];
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


-(void)viewDidLoad {
	
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];
	
}

- (void)dealloc {
    [super dealloc];
}


@end
