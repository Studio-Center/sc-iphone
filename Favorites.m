//
//  Favorites.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/13/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Favorites.h"
#import "Stuff.h"
#import "Audio.h"

static Favorites *sharedFavorites = nil;
@implementation Favorites
@synthesize favorites;

+(Favorites*)shared {
	if (sharedFavorites == nil) {
		sharedFavorites = [[Favorites alloc] init];
	}
	return sharedFavorites;
}

-(id)init {
	if (self = [super init]) {
		NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"favorites"];

		if ([data isKindOfClass:[NSData class]]) {
			favorites = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];	
		} else {
			favorites = nil;
		}

		if (favorites == nil) {
			favorites = [NSMutableArray new];
		}
	}
	return self;
}

-(void)add:(Stuff*)stuff  {
	stuff.savedAt = [NSDate date];
	[favorites addObject:stuff];
	[self synch];
}

-(void)remove:(id)stuff {
	[favorites removeObject:stuff];
}

-(void)synch {
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:favorites];
	[[NSUserDefaults standardUserDefaults] setObject:data forKey:@"favorites"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
