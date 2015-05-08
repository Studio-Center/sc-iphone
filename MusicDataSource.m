//
//  MusicDataSource.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import "MusicDataSource.h"
#import "Audio.h"
#import "AudioCell.h"
#import "Music.h"
#import "MusicCell.h"

@implementation MusicDataSource

- (AudioCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Music *music = [items objectAtIndex:indexPath.row];
	
	MusicCell *cell = [[[MusicCell alloc] initWithStuff:music delegate:nil] autorelease];	
	
    return cell;
}
@end
