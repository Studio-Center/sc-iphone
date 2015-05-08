//
//  BaseDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseDataSource.h"
#import "BaseCell.h"

@implementation BaseDataSource
@synthesize delegate, reloadSelector, items, tableView;
@synthesize methodName;
-(void)dealloc {
	[delegate release];
	[items release];
	[super dealloc];
}

-(id)init {
	if (self = [super init]) {
		items = [NSMutableArray new];
	}
	return self;
}

- (void)setTableView:(UITableView *)aTableView {
	[tableView release];
	tableView = [aTableView retain];
	if (tableView == nil) {
		return;
	}
	tableView.dataSource = self;
	tableView.delegate = self;
	
	[activityIndicator removeFromSuperview];
	[activityIndicator release];
	
	activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	
	activityIndicator.center = CGPointMake(tableView.frame.size.width/2, tableView.frame.size.height/2);
	[tableView addSubview: activityIndicator];
}

-(void)dataLoaded:(NSString*)xml {
	ElementParser* parser = [[ElementParser alloc] init];
	parser.delegate = self;
	[parser performSelector:@selector(getRecord:) forElementsMatching:@"record"];
	[parser parseXML:xml];
	[parser release];
	[self finishLoad];
}

-(void)finishLoad {
	if ([delegate respondsToSelector:reloadSelector]) {
		[delegate performSelector:reloadSelector];
	} else {
		[tableView reloadData];
	}
	for (UIView *view in [tableView subviews]) {
		if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
			[view removeFromSuperview];
		}
	}
	
}


- (void)initLoader {
	[tableView addSubview: activityIndicator];
	[activityIndicator startAnimating];
	[items removeAllObjects];
	[tableView reloadData];
	[loader release];
	loader = [SOAPLoader new];
	[loader setDelegate:self];
	[loader setOnSuccess:@selector(dataLoaded:)];
	[loader setOnError:@selector(error)];
}

-(void)error {
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	UILabel *alert = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
	alert.center = CGPointMake(tableView.frame.size.width/2, tableView.frame.size.height/2);
	alert.backgroundColor = [UIColor clearColor];
	alert.tag = 666;
	alert.text = @"Server is not responding";
	alert.textColor = [UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0];
	[tableView addSubview:alert];
	[alert release];
}
-(void)load {	
	[self initLoader];
	[[tableView viewWithTag:666] removeFromSuperview];
	[loader loadMethod:methodName];
}

-(id)getRecord:(Element*)element {
	id model = [RecordClass new];
	
	if ([model respondsToSelector:@selector(fillFromXML:)]) {
		[model fillFromXML:element];
	}
	
    
	element.domainObject = model;
	[items addObject:model];
	[model release];
	return model;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {	
	[cell setBackgroundColor:[UIColor clearColor]];
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
	[backgroundView setBackgroundColor:[UIColor clearColor]];
	[cell setSelectedBackgroundView:backgroundView];
	[backgroundView release];
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	BaseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	return [cell indentationLevel];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	BaseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[cell select];
}

@end
