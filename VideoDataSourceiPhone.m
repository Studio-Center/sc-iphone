//
//  VideoDataSourceiPhone.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "VideoDataSourceiPhone.h"

@implementation VideoDataSourceiPhone

@synthesize custormCell;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = nil;
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"VideoCell" owner:self options:nil];
        cell = [videoCell retain];
    }
	
	[[cell textLabel] setText:@"asdas"];
	[[cell detailTextLabel] setText:@"asdas"];
	
	return [cell autorelease];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//if (indexPath.row % 2) {
	//	[cell setBackgroundColor:[UIColor grayColor]];
	//} else {
	//	[cell setBackgroundColor:[UIColor lightGrayColor]];
	//}
	[cell setBackgroundColor:[UIColor clearColor]];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (IBAction)accessoryClick:(id)sender {
	BOOL property = YES;
	
	if (property) {
		UIButton *button = sender;
		[button setImage:[UIImage imageNamed:@"barStar.png"] forState:UIControlStateNormal];
	} 
}
@end
