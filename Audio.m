//
//  Audio.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Audio.h"
#import "AudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@implementation Audio
@synthesize  author;
-(id)initWithCoder:(NSCoder *)decoder {
	if (self = [super initWithCoder:decoder]) {
		self.author = [decoder decodeObjectForKey:@"author"];
	}
	return self;
}

- (void) encodeWithCoder: (NSCoder *)coder
{
	[super encodeWithCoder:coder];
	[coder encodeObject:author forKey:@"author"];
}

-(id)init {
	if (self = [super init]) {
		
	}
	return self;
}
- (void)fillFromDict:(NSDictionary*)dict {
	[super fillFromDict:dict];
	Talent *talent = [Talent new];
    talent.udid = [dict valueForKey:@"authorID"];
    talent.desc = [dict valueForKey:@"authorDesc"];
    talent.name = [dict valueForKey:@"authorName"];
	
    talent.url = [NSString stringWithFormat:@"http://www.studiocenter.com/%@",[dict valueForKey:@"authorURL"]];
    
    self.author = talent;
    
    [talent release];
}

- (void)fillFromXML:(Element*)element {
	[super fillFromXML:element];

    Talent *talent = [Talent new];
    talent.udid = [[element selectElement:@"authorID"] contentsText];
    talent.desc = [[element selectElement:@"authorDesc"] contentsText];
    talent.name = [[element selectElement:@"authorName"] contentsText];

    talent.url = [NSString stringWithFormat:@"http://www.studiocenter.com/%@",[[element selectElement:@"authorURL"] contentsText]];
    
    self.author = talent;
    
    [talent release];
}

-(Class)cellClass {
	return NSClassFromString(@"AudioCell");
}


-(void)play {
	
    [AudioPlayer play:self];
}
-(void)stop {
    [AudioPlayer stop];
}
- (NSString *)playlistURL {
	return [url	 stringByAppendingString:@".m3u8"];
}
@end
