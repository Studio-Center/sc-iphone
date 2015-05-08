//
//  Favorites.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/13/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Favorites : NSObject {
	NSMutableArray *favorites;
}
@property (nonatomic, retain) NSMutableArray *favorites;
+(Favorites*)shared;
-(void)add:(id)stuff;
-(void)remove:(id)stuff;
-(void)synch;
@end
