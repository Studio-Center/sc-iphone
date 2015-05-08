//
//  SearchDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/12/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "SearchDataSource.h"
#import "Audio.h"
#import "Video.h"
#import "Talent.h"
#import "Element.h"
#import "ElementParser.h"
#import "SOAPLoader.h"
#import "MixOfWeek.h"
#import "AudioCell.h"
#import "JSON.h"

@implementation SearchDataSource
@synthesize searchToken;

- (void)setSearchToken:(NSString *)aSearchToken {
	NSLog(@"Set search token to %@",aSearchToken);
	searchToken =  [aSearchToken retain];
	[self load];
}

-(void)load {	
	[loader release];
	loader = [SOAPLoader new];
	[loader setDelegate:self];
	[loader setOnSuccess:@selector(dataLoaded:)];
	[loader setOnError:@selector(error)];
	[loader loadMethod:@"search" withParams:[NSDictionary dictionaryWithObject:searchToken forKey:@"token"]];
	activiti = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
	[activiti startAnimating];
	activiti.center = CGPointMake(self.tableView.frame.size.width/2, self.tableView.frame.size.height/2);
	[self.tableView addSubview:activiti];
	[activiti release];
}

- (void)dataLoaded:(NSString*)xml {
	[activiti removeFromSuperview];
	[items removeAllObjects];
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	NSDictionary *JSON = [xml JSONValue];
	NSArray *media = [JSON valueForKey:@"media"];
	NSArray *talents = [JSON valueForKey:@"talents"];
	
	for (NSDictionary *dict in media) {
		if ([[dict valueForKey:@"type"] isEqualToString:@"mix"]) {
			[self getMix:dict];
		} else {
			if ([[dict valueForKey:@"type"] isEqualToString:@"audio"]) {
				[self getAudio:dict];
			} else {
				[self getVideo:dict];
			}
		}
	}
	
	for (NSDictionary *dict in talents) {
		[self getTalent:dict];
	}
	NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	[items sortUsingDescriptors:[NSArray arrayWithObject:desc]];
	[self finishLoad];
	[[tableView viewWithTag:666] removeFromSuperview];
	if ([items count] == 0) {
		[self showNoItemsMessage];
	}
	[pool drain];
}

- (void)showNoItemsMessage {
	UILabel *alert = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 30)];
	alert.center = CGPointMake(tableView.frame.size.width/2, tableView.frame.size.height/2);
	alert.backgroundColor = [UIColor clearColor];
	alert.tag = 666;
	alert.text = @"No results of searching";
	alert.textColor = [UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0];
	[tableView addSubview:alert];
}

- (MixOfWeek*)getMix:(NSDictionary*)element {
	MixOfWeek *model = [MixOfWeek new];
	[model fillFromDict:element];
	
	[items addObject:model];
	[model release];
	return model;
}

-(Audio*)getAudio:(NSDictionary*)element {
	Audio *model = [Audio new];
	[model fillFromDict:element];
	
	[items addObject:model];
	[model release];
	return model;
}

-(Video*)getVideo:(NSDictionary*)element {
	Video *model = [Video new];
	[model fillFromDict:element];
	
	[items addObject:model];
	[model release];
	return model;
}

-(Talent*)getTalent:(NSDictionary*)element {
	Talent *model = [Talent new];
	[model fillFromDict:element];
		
	[items addObject:model];
	[model release];
	return model;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Stuff *stuff = [items objectAtIndex:indexPath.row];
	
	Class cellClass = [stuff cellClass];
	UITableViewCell *cell = nil;
	if (cellClass) {
		cell = [[cellClass alloc] initWithStuff:stuff delegate:nil];
		[cell setAllowFavorite:YES];
		if (isIPad) {
			[[cell favButton] setFrame:CGRectMake(700, 5, 20, 20)];
		} else {
			if (![cell isKindOfClass:[AudioCell class]]) {
				[[cell favButton] setFrame:CGRectMake(285, cell.frame.size.height/2, 20,20)];
			}
		}
	} 
	return [cell autorelease];
}

#pragma mark -
#pragma mark UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	Stuff *stuff = [items objectAtIndex:indexPath.row];
	return [[stuff class] cellRowHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	cell.backgroundColor = [UIColor clearColor];
}
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 0;
}

@end
