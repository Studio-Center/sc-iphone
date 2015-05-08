//
//  Stuff.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface Stuff : NSObject {
	NSString *udid;
	NSString *name, *url;
	NSDate *savedAt;
}
@property (nonatomic, retain) NSString *name, *url;
@property (nonatomic, retain) NSString *udid;
@property (nonatomic, retain) NSDate *savedAt;
-(void)makeFavorite;
-(Class)cellClass;
+(CGFloat)cellRowHeight;
@end
