//
//  SearchDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/12/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "FavoritesDataSource.h"
#import "VideoCell_iPhone.h"

@interface SearchDataSource : FavoritesDataSource {
	NSString *searchToken;
	UIActivityIndicatorView *activiti;
}
@property (nonatomic, retain) NSString *searchToken;
@end
