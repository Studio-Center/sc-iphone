//
//  NSArray+Shuffle.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Helpers)

- (NSArray *) shuffled
{
	// create temporary autoreleased mutable array
	NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id anObject in self)
	{
		NSUInteger randomPos = arc4random()%([tmpArray count]+1);
		[tmpArray insertObject:anObject atIndex:randomPos];
	}
	
	return [NSArray arrayWithArray:tmpArray];  // non-mutable autoreleased copy
}

@end