//
//  FavoritesDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataSource.h"

@interface FavoritesDataSource : BaseDataSource  {
	 UITableViewCell *custormCell;
}
@property (nonatomic, retain) IBOutlet UITableViewCell *custormCell;
@end
