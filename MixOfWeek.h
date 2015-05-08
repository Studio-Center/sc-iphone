//
//  MixOfWeek.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/13/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Audio.h"


@interface MixOfWeek : Audio {
	NSString *mixedBy;
	NSString *createDate;
}
@property (nonatomic, retain) NSString *mixedBy, *createDate;
@end
