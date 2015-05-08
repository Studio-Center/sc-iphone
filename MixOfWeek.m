//
//  MixOfWeek.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/13/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "MixOfWeek.h"


@implementation MixOfWeek
@synthesize mixedBy, createDate;
-(id)initWithCoder:(NSCoder *)decoder {
	if (self = [super initWithCoder:decoder]) {
		self.mixedBy = [decoder decodeObjectForKey:@"mixedBy"];
		self.createDate = [decoder decodeObjectForKey:@"createDate"];
	}
	return self;
}
- (void) encodeWithCoder: (NSCoder *)coder
{
	[super encodeWithCoder:coder];
	[coder encodeObject:createDate forKey:@"createDate"];
	[coder encodeObject:mixedBy forKey:@"mixedBy"];
}
- (void)fillFromDict:(NSDictionary*)dict {
	[super fillFromDict:dict];
	self.mixedBy = [dict valueForKey:@"mixedBy"];
	self.createDate = [dict valueForKey:@"date"];
}
- (void)fillFromXML:(Element*)element {
	[super fillFromXML:element];
	self.mixedBy = [[element selectElement:@"mixedBy"] contentsText];
	self.createDate = [[element selectElement:@"date"] contentsText];
}
-(Class)cellClass {
	return NSClassFromString(@"MixCell");
}

+(CGFloat)cellRowHeight {
	return 80.0;
}
@end
