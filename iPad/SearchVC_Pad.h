//
//  SearchVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchDataSource.h"
#import "BaseiPadController.h"
@interface SearchVC_Pad : BaseiPadController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
	SearchDataSource *searchDataSource;
	UITableView *searchTable;
	UITextField *searchTextField;
}
@property (nonatomic, retain) IBOutlet UITableView *searchTable;
@property (nonatomic, retain) IBOutlet UITextField *searchTextField;

- (IBAction)cancrlButtonClick:(id)sender;

@end
