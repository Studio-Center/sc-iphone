//
//  LocationsDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseDataSource.h"


@interface LocationsDataSource : NSObject <UITableViewDataSource> {
	NSMutableArray *locations;
}
@property (nonatomic, retain) NSMutableArray *locations;
+(LocationsDataSource*)shared;
@end
