//
//  Talent.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Talent.h"


@implementation Talent
@synthesize desc, bigImageURL;

-(id)initWithCoder:(NSCoder *)decoder {
	if (self = [super initWithCoder:decoder]) {
		self.desc = [decoder decodeObjectForKey:@"desc"];
	}
	return self;
}

- (void) encodeWithCoder: (NSCoder *)coder
{
	[super encodeWithCoder:coder];
	[coder encodeObject:desc forKey:@"desc"];
}
-(void)fillFromDict:(NSDictionary *)dict {
	[super fillFromDict:dict];
	self.bigImageURL = [NSString stringWithFormat:@"http://www.studiocenter.com/%@",[dict valueForKey:@"bigImageURL"]];
}

-(void)fillFromXML:(Element *)element {
	[super fillFromXML:element];
	self.bigImageURL = [NSString stringWithFormat:@"http://www.studiocenter.com/%@",[[element selectElement:@"bigImageURL"] contentsText]];
}

-(NSString*)cellClass {
	return NSClassFromString(@"TalentFavoriteCell");
}

+(CGFloat)cellRowHeight {
	return 180.0;
}

-(NSString*)description {
	return [NSString stringWithFormat:@"Talent {Name:%@,ID:%@,URL:%@}",name,udid,url];
}

@end
