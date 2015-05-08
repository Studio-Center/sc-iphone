//
//  Audio.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stuff.h"
#import "Talent.h"

@interface Audio : Stuff {
	Talent *author;
}
- (NSString *)playlistURL;
@property (nonatomic, retain) Talent *author;
@end
