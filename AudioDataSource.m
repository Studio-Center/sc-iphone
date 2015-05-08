//
//  AudioDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/2/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AudioDataSource.h"
#import "AudioCell.h"
#import "Audio.h"
#import "Element.h"
#import "ElementParser.h"
#import "SOAPLoader.h"

/*/ delete later*/ #import "Talent.h"


@implementation AudioDataSource

-(id)init {
	if (self = [super init]) {
		RecordClass = [Audio class];
	}
	return self;
}

-(IBAction)shake:(id)sender {
	if ([items count]>0) {
		[delegate changeTalent:[items objectAtIndex:rand()%[items count]]];
	}
}

#pragma mark -
#pragma mark UITableView DataSource methods

- (AudioCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Audio *audio = [items objectAtIndex:indexPath.row];
	AudioCell *cell = [[[AudioCell alloc] initWithStuff:audio delegate:nil] autorelease];	
	
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 5;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (isIPad) {
		[super tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
		[cell setIndentationWidth:0.0];
	} else {
		//if (indexPath.row % 2) {
		//	[cell setBackgroundColor:[UIColor grayColor]];
		//} else {
		//	[cell setBackgroundColor:[UIColor lightGrayColor]];
		//}
		[cell setBackgroundColor:[UIColor clearColor]];
		
		UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
		[backgroundView setBackgroundColor:[UIColor clearColor]];
		[cell setSelectedBackgroundView:backgroundView];
		[backgroundView release];
	}
	
}


@end
