//
//  VideoDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "VideoDataSource.h"
#import "Video.h"


@implementation VideoDataSource
@synthesize videoCell;
-(id)init {
	if (self = [super init]) {
		RecordClass = [Video class];
	}
	return self;
}

-(void)finishLoad {
	NSMutableArray *store = [NSMutableArray new];
	NSMutableArray *newItems = [NSMutableArray new];
	for (Video *video in self.items) {
		[store addObject:video];		
		if ([store count]==2) {
			NSMutableArray *storeCopy = [store copy];
			[newItems addObject:storeCopy];
			[storeCopy release];
			[store removeAllObjects];
		}
	}
	
	if ([store count]>0) {
		[newItems addObject:store];
	}
	[store release];
	
	self.items = newItems;
	[newItems release];
	[super finishLoad];
}

-(void)playVideo:(Video*)video {
	[delegate playVideo:video];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[[NSBundle mainBundle] loadNibNamed:@"VideoCell_Pad" owner:self options:nil];
	VideoCell_Pad *cell = [self.videoCell retain];
	cell.delegate = self;
	self.videoCell = nil;
	
	
	[cell setRow:[items objectAtIndex:indexPath.row]];
	
	return cell;
}

@end
