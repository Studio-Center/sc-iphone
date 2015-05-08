//
//  ForeignAudioDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "ForeignAudioDataSource.h"
#import "ForeignAudio.h"
#import "ForeignCell.h"


@implementation ForeignAudioDataSource
-(void)dealloc {
	[sections release];
	[super dealloc];
}

-(id)init {
	if (self = [super init]) {
		sections = [NSMutableDictionary new];
		RecordClass = [ForeignAudio class];
	}
	return self;
}
-(void)finishLoad {
	NSMutableDictionary *countrys = [NSMutableDictionary dictionary];

	for (ForeignAudio *fa in items) {
		if ([countrys valueForKey:fa.country]) {
			[[countrys valueForKey:fa.country] addObject:fa];
		} else {
			[countrys setObject:[NSMutableArray array] forKey:fa.country];
			[[countrys valueForKey:fa.country] addObject:fa];
		}
	}
	
	NSMutableDictionary *tmp = [NSMutableDictionary dictionary];
	for (NSString *country in countrys) {
		NSMutableDictionary *authors = [NSMutableDictionary dictionary];
		for (ForeignAudio *fa in [countrys valueForKey:country]) {
			if ([authors valueForKey:fa.author.name]) {
				[[authors valueForKey:fa.author.name] addObject:fa];
			} else {
				[authors setObject:[NSMutableArray array] forKey:fa.author.name];
				[[authors valueForKey:fa.author.name] addObject:fa];
			}
		}
		NSMutableDictionary *newAuthors = [NSMutableDictionary dictionary];
		for (NSString *key in authors) {
				NSArray *audios = [authors valueForKey:key];
				[newAuthors setObject:[audios objectAtIndex:rand()%[audios count]] forKey:key];
		}
		[tmp setObject:[newAuthors allValues] forKey:country];
	}
	[sections release];
	sections = [tmp retain];
	[super finishLoad];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [[sections allKeys] count];
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [[sections objectForKey:[[sections allKeys] objectAtIndex:section]]  count];
}
- (AudioCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ForeignAudio *audio = [[sections objectForKey:[[sections allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	ForeignCell *cell = [[[ForeignCell alloc] initWithStuff:audio delegate:nil] autorelease];	
	
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
	UILabel	*text = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 25)];
	text.backgroundColor = [UIColor clearColor];
	text.textColor = [UIColor whiteColor];
	text.text = [[sections allKeys] objectAtIndex:section];
	
	header.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
	[header addSubview:text];
	[text release];
	return [header autorelease];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 25.0f;
}
@end
