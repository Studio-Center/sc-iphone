//
//  Stuff.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Stuff.h"


@implementation Stuff
@synthesize udid, savedAt, name, url;

-(id)initWithCoder:(NSCoder *)decoder {
	if (self = [super init]) {
		self.udid = [decoder decodeObjectForKey:@"udid"];
		self.savedAt = [decoder decodeObjectForKey:@"savedAt"];
		self.name = [decoder decodeObjectForKey:@"name"];
		self.url = [decoder decodeObjectForKey:@"url"];
	}
	return self;
}

- (void) encodeWithCoder: (NSCoder *)coder
{
	[coder encodeObject:udid forKey:@"udid"];
	[coder encodeObject:savedAt forKey:@"savedAt"];
	[coder encodeObject:name forKey:@"name"];
	[coder encodeObject:url forKey:@"url"];
}
- (void)fillFromDict:(NSDictionary*)dict {
	self.udid = [dict valueForKey:@"id"];
	self.name = [dict valueForKey:@"name"];
	
	NSString *urlString = [dict valueForKey:@"url"];
	
	
	
	if ([urlString isEqualToString:@""]) {
		self.url = nil;
	} else {
		NSString *filteredURL = [[urlString stringByReplacingOccurrencesOfString:@"~" withString:@""] stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
		filteredURL = [filteredURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
		self.url = [NSString stringWithFormat:@"http://www.studiocenter.com%@",filteredURL];
		
	}
}
- (void)fillFromXML:(Element*)element {

	self.udid = [[element selectElement:@"id"] contentsText];
	self.name = [[element selectElement:@"name"] contentsText];
	
	NSString *urlString = [[element selectElement:@"url"] contentsText];
	
	
	
	if ([urlString isEqualToString:@""]) {
		self.url = nil;
	} else {
		NSString *filteredURL = [[urlString stringByReplacingOccurrencesOfString:@"~" withString:@""] stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
		filteredURL = [filteredURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

		self.url = [NSString stringWithFormat:@"http://www.studiocenter.com%@",filteredURL];
		
	}
}

-(void)setIsFavorite:(BOOL)isfav {
	if (isfav) {
		if (![self isFavorite]) {
			[[Favorites shared] add:self];
		}
	} else {
		[[Favorites shared] remove:self];
	}
}

-(BOOL)isFavorite {
	return [[[Favorites shared] favorites] containsObject:self];
}

-(Class)cellClass {
	return nil;
}

+(CGFloat)cellRowHeight {
	return 40.0;
}

-(BOOL)isEqual:(Stuff*)object {
	if (![object.udid isEqual:self.udid]) {
		return NO;
	} else {
		if ([object isMemberOfClass:[self class]]) {
			return YES;
		} else {
			return NO;
		}

	}
}
@end
