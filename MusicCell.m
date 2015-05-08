//
//  MusicCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "MusicCell.h"


@implementation MusicCell
- (void)setup {
	[super setup];
	title.text = [stuff name];
	if (isIPad) {
		favButton.center = CGPointMake(325, 12);
	} else {
		favButton.center = CGPointMake(295, 12);
	}
}
@end
