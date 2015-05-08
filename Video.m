//
//  Video.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Video.h"


@implementation Video
@synthesize length;

-(id)initWithCoder:(NSCoder *)decoder {
	if (self = [super initWithCoder:decoder]) {
		self.length = [decoder decodeObjectForKey:@"length"];
	}
	return self;
}

- (void) encodeWithCoder: (NSCoder *)coder
{
	[super encodeWithCoder:coder];
	[coder encodeObject:length forKey:@"length"];
}

-(NSString*)cellClass {
	if (isIPad) {
		return NSClassFromString(@"VideoFavoriteCell");
	} else {
		return NSClassFromString(@"VideoCell_iPhone");
	}
}

-(NSString*)videoPath {
	return [[self url] stringByAppendingString:@".m3u8"];
}

-(NSString*)previeURL {
	return [[self url] stringByAppendingString:@"-previe.jpg"];
}

+(CGFloat)cellRowHeight {
	return 100.0;
}
@end
