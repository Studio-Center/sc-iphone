    //
//  AudioVCSecond_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 25.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioVCSecond_Pad.h"
#import "PadNavigator.h"

@implementation AudioVCSecond_Pad

- (IBAction)shakeResultsClick:(id)sender {
	NSLog(@"Shake results click");
}

#pragma mark -
#pragma mark UITableView DataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CtName"] autorelease];
    }
	
	UIImageView *accesoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_unselected.png"]];
	[cell setAccessoryView:accesoryImageView];
	[accesoryImageView release];
	
	[[cell imageView] setImage:[UIImage imageNamed:@"playButton.png"]];
	
    [[cell textLabel] setText:@"Some text"];
	[[cell textLabel] setTextColor:[UIColor whiteColor]];
	[[cell textLabel] setBackgroundColor:[UIColor clearColor]];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[cell setBackgroundColor:[UIColor clearColor]];
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
	[backgroundView setBackgroundColor:[UIColor clearColor]];
	[cell setSelectedBackgroundView:backgroundView];
	[backgroundView release];
}

#pragma mark -
#pragma mark UItableView delegate methods

- (void)viewDidLoad {
	[[PadNavigator sharedNavigator] setCanRotatePortrait:YES];
	[[PadNavigator sharedNavigator] setCanRotateLandscape:NO];
	
	if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
	} else {
		[[PadNavigator sharedNavigator] rotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView reloadData];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[[cell imageView] setImage:[UIImage imageNamed:@"stopButton.png"]];
}

#pragma mark -
#pragma mark UIViewController methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
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
