//
//  Talent.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stuff.h"

@interface Talent : Stuff {
	NSString *desc;
	NSString *bigImageURL;
}
@property (nonatomic, retain) NSString *bigImageURL;
@property (nonatomic, retain) NSString *desc;

@end
