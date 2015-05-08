//
//  ForeignCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "ForeignCell.h"


@implementation ForeignCell
-(void)setup {
	[super setup];
	title.text = [NSString stringWithFormat:@"%@ - %@",[[stuff author] name],[stuff country]];
	if (isIPad) {
		favButton.center = CGPointMake(320, 12);
	} else {
		favButton.center = CGPointMake(295, 12);
	}
}
@end
