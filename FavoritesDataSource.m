//
//  FavoritesDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "FavoritesDataSource.h"
#import "Stuff.h"
#import "BaseCell.h"
#import "VideoCell_iPhone.h"

@implementation FavoritesDataSource
@synthesize custormCell;

#pragma mark -
#pragma mark UITableView DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[Favorites shared] favorites] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Stuff *stuff  = [[[Favorites shared] favorites] objectAtIndex:indexPath.row];
	Class cellClass = [stuff cellClass];
	UITableViewCell *cell = nil; //[tableView dequeueReusableCellWithIdentifier:@"sccell"];
	if (cellClass) {
        if(cell == nil) {
            cell = [[[cellClass alloc] initWithStuff:stuff delegate:nil] autorelease];
            [cell setAllowFavorite:NO];
            [cell enableFavoritePageMode];
            
        } else {
            [cell setStuff:stuff];
        }
		
	}
	return cell;
}

#pragma mark -
#pragma mark UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	Stuff *stuff = [[[Favorites shared] favorites] objectAtIndex:indexPath.row];
	return [[stuff class] cellRowHeight];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	Stuff *stuff = [[[Favorites shared] favorites] objectAtIndex:indexPath.row];
	[[Favorites shared] remove:stuff];
	[tableView beginUpdates];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
	[tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (!isIPad) {
		[cell setIndentationWidth:0.0];
	}
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	id cell = [tableView cellForRowAtIndexPath:indexPath];
	if ([cell respondsToSelector:@selector(select)]) {
		[cell select];
	}
}
@end
