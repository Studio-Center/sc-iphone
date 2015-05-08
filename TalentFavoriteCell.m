//
//  TalentFavoriteCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "TalentFavoriteCell.h"
#import "AsynchronousImageView.h"

@implementation TalentFavoriteCell
- (void) setup {	
	
	AsynchronousImageView *img = [AsynchronousImageView new];
	[img loadImageFromURLString:stuff.url];
	img.frame = CGRectMake(40, 10, 130, 160);
	[[self contentView] addSubview:img];
	[img release];
	
	UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 400, 80)];
	title.text = [stuff name];
	title.numberOfLines = 4;
	
	title.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:title];
	[title release];
	
	if (isIPad) {
		favButton.center = CGPointMake(220, 12);
		title.textColor = [UIColor whiteColor];
	} else {
		//title.textColor = [UIColor blackColor];
		title.textColor = [UIColor whiteColor];
		img.frame = CGRectMake(5, 10, 130, 160);
		title.frame = CGRectMake(140, 0, 130, 80);
	}
}

@end
