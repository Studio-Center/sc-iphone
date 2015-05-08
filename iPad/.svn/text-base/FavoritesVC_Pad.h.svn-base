//
//  FavoritesVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesDataSource.h"
#import "BaseiPadController.h"

@interface FavoritesVC_Pad : BaseiPadController <UITableViewDelegate, UITableViewDataSource> {
	FavoritesDataSource *dataSource;
	UITableView *tableView;
	UIButton *edit;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIButton *edit;
- (IBAction)editButtonClick:(id)sender;

@end
