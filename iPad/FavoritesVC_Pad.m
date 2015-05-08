    //
//  FavoritesVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavoritesVC_Pad.h"
#import "PadNavigator.h"


@implementation FavoritesVC_Pad
@synthesize tableView, edit;

- (IBAction)editButtonClick:(id)sender {
	[tableView setEditing:!tableView.editing animated:YES];
	if (tableView.editing) {
		[edit setTitle:@"Done" forState:UIControlStateNormal];
	} else {
		[edit setTitle:@"Edit" forState:UIControlStateNormal];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView	reloadData];
}

- (void)viewDidLoad {
	dataSource = [FavoritesDataSource new];
	dataSource.tableView = self.tableView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

@end
