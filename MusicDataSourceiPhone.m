//
//  MusicDataSourceiPhone.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "MusicDataSourceiPhone.h"
#import "MusicCell.h"
#import "Music.h"


@implementation MusicDataSourceiPhone

-(id)init {
	if (self = [super init]) {
		jingels = [NSMutableArray new];
		original = [NSMutableArray new];
	}
	return self;
}

-(void)load {
	[jingels release];
	jingels = nil;
	[original release];
	original = nil;
	
	[jinglesLoader release];
	jinglesLoader = [SOAPLoader new];
	[jinglesLoader setDelegate:self];
	[jinglesLoader setOnSuccess:@selector(jinglesLoaded:)];
	[jinglesLoader loadMethod:@"getJingles"];
	
	[originalLoader release];
	originalLoader = [SOAPLoader new];
	[originalLoader setDelegate:self];
	[originalLoader setOnSuccess:@selector(originalLoaded:)];
	[originalLoader loadMethod:@"getOriginal"];
	
	[tableView addSubview: activityIndicator];
	[activityIndicator startAnimating];
}

-(void)finishLoad {
	if (jingels&&original) {
		[tableView reloadData];
		[activityIndicator stopAnimating];
		[activityIndicator removeFromSuperview];
	}
}

-(void)originalLoaded:(NSString*)xml {
	original = [NSMutableArray new];
	ElementParser* parser = [[ElementParser alloc] init];
	parser.delegate = self;
	[parser performSelector:@selector(getOrig:) forElementsMatching:@"record"];
	[parser parseXML:xml];
	[parser release];
	[self finishLoad];
}

-(Music*)getOrig:(Element*)xml {
	Music *model = [Music new];
	[model fillFromXML:xml];
	
	xml.domainObject = model;
	[original addObject:model];
	[model release];
	return model;
}
-(void)jinglesLoaded:(NSString*)xml {
	jingels = [NSMutableArray new];
	ElementParser* parser = [[ElementParser alloc] init];
	parser.delegate = self;
	[parser performSelector:@selector(getJingl:) forElementsMatching:@"record"];
	[parser parseXML:xml];
	[parser release];
	[self finishLoad];
}
-(Music*)getJingl:(Element*)xml {
	Music *model = [Music new];
	[model fillFromXML:xml];
	
	xml.domainObject = model;
	[jingels addObject:model];
	[model release];
	return model;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if (jingels&&original) {
		return 2;
	} else {
		return 0;
	}

}
- (AudioCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Music *music = nil;
	if (indexPath.section == 0) {
		music = [original objectAtIndex:indexPath.row];
	} else {
		music = [jingels objectAtIndex:indexPath.row];
	}

	MusicCell *cell = [[[MusicCell alloc] initWithStuff:music delegate:nil] autorelease];	
	
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
	UILabel	*text = [[UILabel alloc] initWithFrame:CGRectMake(120, 2, 200, 22)];
	text.backgroundColor = [UIColor clearColor];
	text.textColor = [UIColor whiteColor];
	if (section == 0) {
		text.text = @"Original";
	} else {
		text.text = @"Jingles";
	}
	
	header.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
	[header addSubview:text];
	[text release];
	return [header autorelease];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"Original Music";
	} else {
		return @"Jingles";
	}
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 25.0f;
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return [original count];
	} else {
		return [jingels count];
	}
}

-(void)dealloc {
	[jingels release];
	[original release];
	[jinglesLoader release];
	[originalLoader release];
	[super dealloc];
}
@end
