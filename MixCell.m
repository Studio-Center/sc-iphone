//
//  MixCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "MixCell.h"


@implementation MixCell
-(void)setup {
	[super setup];
	[title removeFromSuperview];
	
	//self.play.center = CGPointMake(play.center.x-20, play.center.y);
	
	UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(45, 2, 250, 20)];
	title.text = [stuff name];
	if (isIPad) {
		title.textColor = [UIColor whiteColor];
	} else {
		title.textColor = [UIColor whiteColor];
	}


	title.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:title];
	[title release];
	
	UILabel *mixedBy = [[UILabel alloc] initWithFrame:CGRectMake(50, 22, 250, 20)];

	mixedBy.text = [stuff mixedBy];
	if (isIPad) {
		mixedBy.textColor = [UIColor whiteColor];
	} else {
		mixedBy.textColor = [UIColor whiteColor];
	}

	mixedBy.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:mixedBy];
	[mixedBy release];
	
	UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(50, 42, 200, 20)];
	date.text =  [stuff createDate];
	if (isIPad) {
		date.textColor = [UIColor whiteColor];
	} else {
		date.textColor = [UIColor whiteColor];
	}

	date.backgroundColor = [UIColor clearColor];
	[self.contentView addSubview:date];
	[date release];
	
}
@end
