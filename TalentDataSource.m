//
//  TalentDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "TalentDataSource.h"
#import "Talent.h"

@implementation TalentDataSource
-(void)load {	
	[super load];
}

-(void)dataLoaded:(NSString*)xml {
	ElementParser* parser = [[ElementParser alloc] init];
	parser.delegate = self;
	[parser performSelector:@selector(getVideo:) forElementsMatching: @"record"];
	[parser parseXML:xml];
	[parser release];
	[self finishLoad];
}

- (void)finishLoad {
	NSLog(@"items.count = %d",[items count]);
	[delegate setContent:items];
	[delegate setCurrentPage:0];
}

-(Talent*)getVideo:(Element*)element {
	Talent *model = [Talent new];
	[model fillFromXML:element];

	element.domainObject = model;
	if ([model.url length]>0) {
		[items addObject:model];
	}
	
	[model release];
	return model;
}

@end
