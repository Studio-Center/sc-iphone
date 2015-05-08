//
//  MixDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import "MixDataSource.h"
#import "MixCell.h"
#import "MixOfWeek.h"

@implementation MixDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70.0;
}

-(MixOfWeek*)getRecord:(Element*)element {
	MixOfWeek *model = [MixOfWeek new];
	[model fillFromXML:element];
	
	element.domainObject = model;
	[items addObject:model];
	[model release];
	return model;
}

- (AudioCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MixOfWeek *audio = [items objectAtIndex:indexPath.row];
	MixCell *cell = [[[MixCell alloc] initWithStuff:audio delegate:nil] autorelease];	
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AudioCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
	if (isIPad) {
		cell.favButton.center = CGPointMake(320, 40);
	} else {
		cell.favButton.center = CGPointMake(300, cell.frame.size.height/2);
	}

	
}

@end
