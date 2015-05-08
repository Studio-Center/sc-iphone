//
//  ForeignAudio.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "Audio.h"


@interface ForeignAudio : Audio {
	NSString *country;
}
@property (nonatomic, retain) NSString *country;
@end
