//
//  FavoritesVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavoritesVC_Phone.h"
#import "FavoritesDataSource.h"

@implementation FavoritesVC_Phone

-(void)viewDidLoad {
	tableView.separatorColor = [UIColor blackColor];
    dataSource = [FavoritesDataSource new];
    dataSource.tableView = tableView;
    dataSource.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
	[[PhoneNavigator shared] makeArrowsHidden:YES];
	UILabel *mainLabel = [[PhoneNavigator shared] mainLabel];
	CGPoint p = CGPointMake(mainLabel.frame.origin.x + 15, mainLabel.center.y);
	[[PhoneNavigator shared].favoritesButton setCenter:p];
}
-(void)viewWillDisappear:(BOOL)animated {
	[[AudioPlayer shared] stopAudio];
}
- (IBAction)setEditable:(id)sender {
    [tableView setEditing:!tableView.editing animated:YES];
	if (tableView.editing) {
		[edit setTitle:@"Done" forState:UIControlStateNormal];
	} else {
		[edit setTitle:@"Edit" forState:UIControlStateNormal];
	}
}
@end
