//
//  SearchVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneNavigator.h"
#import "BaseViewController.h"

@class SearchDataSource;
@interface SearchVC_Phone : BaseViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {

	UISearchBar *searchingBar;
	UITableView *searchTable;
	SearchDataSource *searchDataSource;
}

@property (nonatomic, retain) IBOutlet UITableView *searchTable;
@property (nonatomic, retain) IBOutlet UISearchBar *searchingBar;

@end
