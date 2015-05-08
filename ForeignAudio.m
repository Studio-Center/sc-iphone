//
//  ForeignAudio.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "ForeignAudio.h"


@implementation ForeignAudio
@synthesize country;
- (void)fillFromXML:(Element*)element {
	[super fillFromXML:element];
	self.country = [[element selectElement:@"country"] contentsText];
}
-(NSString*)description {
	return [NSString stringWithFormat:@"ForeignAudio:{name:%@,author:%@,country:%@,url:%@}",name,self.author.name,country,url];
}
@end
