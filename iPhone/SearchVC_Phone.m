//
//  SearchVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SearchVC_Phone.h"
#import "SearchDataSource.h"

@implementation SearchVC_Phone
@synthesize searchingBar, searchTable;

#pragma mark -
#pragma mark UISearchBarDelegate methods


-(void)textFieldShouldReturn:(UITextField *)textField {
	searchDataSource.searchToken = [textField text];
}

- (void)viewDidLoad {
	searchTable.separatorColor = [UIColor blackColor];
	searchDataSource = [SearchDataSource new];
	searchDataSource.tableView = searchTable;
}
-(void)viewWillDisappear:(BOOL)animated {
	[[AudioPlayer shared] stopAudio];
}
- (void)viewWillAppear:(BOOL)animated {
	[[PhoneNavigator shared] makeArrowsHidden:YES];
	[[PhoneNavigator shared].searchButton setHidden:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	[searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[searchBar resignFirstResponder];
	searchDataSource.searchToken = [searchBar text];
}

@end
