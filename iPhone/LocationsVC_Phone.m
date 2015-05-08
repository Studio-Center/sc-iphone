//
//  LocationsVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocationsVC_Phone.h"
#import "LocationsDataSource.h"
#import "Location.h"
#import "LocationMap.h"

@implementation LocationsVC_Phone
@synthesize tableView;

-(void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:YES];
}

#pragma mark -
#pragma mark UITableView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[LocationsDataSource shared] locations] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LocationCell"] autorelease];
    }
	Location *location = [[[LocationsDataSource shared] locations] objectAtIndex:indexPath.row];
	
	UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 24)];
	header.font = [UIFont boldSystemFontOfSize:20];
	header.shadowColor = [UIColor grayColor];
	header.textColor = [UIColor whiteColor];
	header.shadowOffset = CGSizeMake(0, 1);
	header.text = location.title;
	header.backgroundColor = [UIColor clearColor];
	[cell.contentView addSubview:header];
	[header release];
	
	UITextView *address = [[UITextView alloc] initWithFrame:CGRectMake(0, 30, 280, 80)];
	//address.dataDetectorTypes = UIDataDetectorTypeAll;
	[address setEditable:NO];
	address.font = [UIFont fontWithName:@"Helvetica" size:13];
	address.textColor = [UIColor whiteColor];
	address.backgroundColor = [UIColor clearColor];
	address.text = location.adress;
	[cell.contentView addSubview:address];
	[address release];
	
	UIImageView *accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapAccessory.png"]];
	[cell setAccessoryView:accessoryView];
	[accessoryView release];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 120;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//if (indexPath.row % 2) {
	//	[cell setBackgroundColor:[UIColor grayColor]];
	//} else {
	//	[cell setBackgroundColor:[UIColor lightGrayColor]];
	//}
	[cell setBackgroundColor:[UIColor clearColor]];
	
	UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
	[selectedBackgroundView setBackgroundColor:[UIColor clearColor]];
	[cell setSelectedBackgroundView:selectedBackgroundView];
	[selectedBackgroundView release];
}

#pragma mark -
#pragma mark UITableView delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Location *location = [[[LocationsDataSource shared] locations] objectAtIndex:indexPath.row];
	LocationMap *map = [[LocationMap alloc] initWithLocation:location];
	[self.navigationController pushViewController:map animated:YES];
	[map release];
}

#pragma mark -
#pragma mark UIViewController methods

-(void)viewDidLoad{
	
	tableView.separatorColor = [UIColor blackColor];
	
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];
	
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
