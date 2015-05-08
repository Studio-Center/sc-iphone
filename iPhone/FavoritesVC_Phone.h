//
//  FavoritesVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesVC_Pad.h"
#import "PhoneNavigator.h"
#import "BaseViewController.h"

@interface FavoritesVC_Phone : BaseViewController  {
	
	IBOutlet UIButton *edit;
	IBOutlet UITableView *tableView;
    FavoritesDataSource *dataSource;
}

- (IBAction)setEditable:(id)sender;
@end
