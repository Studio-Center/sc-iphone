//
//  BaseDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MockDataSource.h"
#import "NSArray+Shuffle.h"
#import "SOAPLoader.h"

@interface BaseDataSource : NSObject <UITableViewDataSource, UITableViewDelegate> {
	id delegate;
	SEL reloadSelector;
	NSMutableArray *items;
	
	NSString *methodName;
	UITableView *tableView;
	UIActivityIndicatorView *activityIndicator;
	
	SOAPLoader *loader;
	Class RecordClass;
}
@property (nonatomic, retain) NSString *methodName;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) id delegate;
@property (assign) SEL reloadSelector;
@property (nonatomic, retain) NSMutableArray *items;
@end
